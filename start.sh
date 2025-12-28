#!/bin/bash

# Create log directory
mkdir -p /var/log/supervisor

# Start D-Bus first
service dbus start

# Generate xrdp keys if they don't exist
if [ ! -f /etc/xrdp/rsakeys.ini ]; then
    xrdp-keygen xrdp auto
fi

# Start HTTP server to keep Render awake (prevents FREE tier sleep)
cat > /tmp/health_server.py << 'EOF'
from http.server import HTTPServer, BaseHTTPRequestHandler
import datetime

class HealthHandler(BaseHTTPRequestHandler):
    def do_GET(self):
        self.send_response(200)
        self.send_header('Content-type', 'text/html')
        self.end_headers()
        html = f"""
        <html>
        <head><title>RDP Server Status</title></head>
        <body style="font-family: Arial; padding: 20px;">
            <h1 style="color: green;">✅ RDP Server is ALIVE!</h1>
            <p><strong>Status:</strong> Running</p>
            <p><strong>Time:</strong> {datetime.datetime.now()}</p>
            <p><strong>RDP Port:</strong> 3389</p>
            <p><strong>Free Tier:</strong> Staying awake via HTTP pings</p>
        </body>
        </html>
        """
        self.wfile.write(html.encode())
    
    def log_message(self, format, *args):
        pass  # Suppress logging

if __name__ == '__main__':
    server = HTTPServer(('0.0.0.0', 8000), HealthHandler)
    server.serve_forever()
EOF

python3 /tmp/health_server.py &

# Print connection info
echo "====================================="
echo "     RDP SERVER READY"
echo "====================================="
echo "Connect to this server using:"
echo "Address: [Your Render URL]:3389"
echo "Username: ${RDP_USER:-rdpuser}"
echo "Password: ${RDP_PASSWORD:-ChangeMe123!}"
echo "Health Check: http://[Your URL]:8000"
echo "====================================="

# Start supervisor
exec /usr/bin/supervisord -c /etc/supervisor/conf.d/supervisord.conf
