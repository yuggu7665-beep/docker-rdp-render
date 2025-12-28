#!/bin/bash

# Health check endpoint for Render - prevents sleep
# This script runs inside the container

echo "Content-Type: text/html"
echo ""
echo "<html><body>"
echo "<h1>RDP Server is ALIVE! ✅</h1>"
echo "<p>Status: Running</p>"
echo "<p>Time: $(date)</p>"
echo "<p>Uptime: $(uptime -p)</p>"
echo "</body></html>"
