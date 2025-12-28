#!/usr/bin/env python3
"""
Render Deployment Helper Script
This script provides CLI instructions for deploying to Render
"""

print("""
╔════════════════════════════════════════════════════════════════╗
║          Docker RDP Server - Render Deployment                ║
╔════════════════════════════════════════════════════════════════╗

✅ GitHub Repository Created Successfully!
   URL: https://github.com/yuggu7665-beep/docker-rdp-render

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

📋 NEXT STEPS - Deploy to Render:

Since Render doesn't have a full CLI yet, you need to:

1️⃣  Go to Render Dashboard:
    https://dashboard.render.com/

2️⃣  Click "New +" → "Blueprint"

3️⃣  Connect GitHub (if not already connected)

4️⃣  Select repository: "yuggu7665-beep/docker-rdp-render"

5️⃣  Render will detect render.yaml automatically

6️⃣  Click "Apply" to start deployment

7️⃣  Set Environment Variables in Render dashboard:
    • RDP_USER: rdpuser (or your choice)
    • RDP_PASSWORD: YourStrongPassword123!

8️⃣  Wait 5-10 minutes for deployment

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

📊 DEPLOYMENT INFO:

Plan Options:
  • Free: $0/month (sleeps after 15min idle)
  • Starter: $7/month (24/7 uptime) ⭐ RECOMMENDED
  • Standard: $25/month (2GB RAM, better performance)

After Deployment:
  • URL: Will be shown as: your-service.onrender.com
  • Port: 3389
  • Connect: Use RDP client to your-service.onrender.com:3389

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

🔐 SECURITY REMINDER:

Change the default password! Use a strong password with:
  ✓ At least 16 characters
  ✓ Uppercase and lowercase letters
  ✓ Numbers
  ✓ Special characters

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

🎯 QUICK CONNECT AFTER DEPLOYMENT:

Windows:
  1. Press Win + R
  2. Type: mstsc
  3. Enter: your-service.onrender.com:3389
  4. Username: rdpuser
  5. Password: [Your password from Render env vars]

Linux:
  xfreerdp /v:your-service.onrender.com:3389 /u:rdpuser

Mac:
  Use Microsoft Remote Desktop app from App Store

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

📖 Need Help?
  • Check: DEPLOYMENT_GUIDE.md
  • Logs: Render Dashboard → Logs tab
  • Status: Render Dashboard → Events tab

╚════════════════════════════════════════════════════════════════╝
""")

# Keep script open
input("\nPress Enter to exit...")
