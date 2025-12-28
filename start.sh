#!/bin/bash

# Create log directory
mkdir -p /var/log/supervisor

# Start D-Bus first
service dbus start

# Generate xrdp keys if they don't exist
if [ ! -f /etc/xrdp/rsakeys.ini ]; then
    xrdp-keygen xrdp auto
fi

# Print connection info
echo "====================================="
echo "     RDP SERVER READY"
echo "====================================="
echo "Connect to this server using:"
echo "Address: [Your Render URL]:3389"
echo "Username: ${RDP_USER:-rdpuser}"
echo "Password: ${RDP_PASSWORD:-ChangeMe123!}"
echo "====================================="

# Start supervisor
exec /usr/bin/supervisord -c /etc/supervisor/conf.d/supervisord.conf
