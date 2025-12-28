# 🖥️ 24/7 Docker RDP Server on Render

Deploy a **24/7 Windows-like desktop environment** accessible via RDP using Docker and Render!

## ✨ Features

- 🐧 **Ubuntu 22.04** with XFCE desktop environment
- 🔐 **Secure RDP access** with customizable credentials
- 🚀 **One-click deployment** to Render
- 🔄 **Auto-restart** on failure
- 💾 **Persistent storage** for your files
- 🌐 **24/7 availability** (based on Render plan)

## 🚀 Quick Deploy to Render

### Step 1: Push to GitHub

1. Create a new GitHub repository
2. Clone this folder to your repository:
   ```bash
   git init
   git add .
   git commit -m "Initial RDP server setup"
   git branch -M main
   git remote add origin https://github.com/YOUR-USERNAME/YOUR-REPO.git
   git push -u origin main
   ```

### Step 2: Deploy on Render

1. Go to [Render Dashboard](https://dashboard.render.com/)
2. Click **"New +"** → **"Blueprint"**
3. Connect your GitHub repository
4. Render will automatically detect `render.yaml`
5. Click **"Apply"**
6. Wait for deployment (5-10 minutes)

### Step 3: Configure Environment Variables

In Render Dashboard:
1. Go to your service → **Environment**
2. Update these variables:
   - `RDP_USER`: Your preferred username (default: `rdpuser`)
   - `RDP_PASSWORD`: **IMPORTANT** - Set a strong password!

### Step 4: Get Connection Details

1. Once deployed, note your service URL (e.g., `rdp-server-xxxx.onrender.com`)
2. RDP Port: `3389`
3. Use your configured credentials

### Step 5: Connect via RDP

**Windows:**
1. Open **Remote Desktop Connection** (`mstsc.exe`)
2. Enter: `rdp-server-xxxx.onrender.com:3389`
3. Username: Your `RDP_USER`
4. Password: Your `RDP_PASSWORD`

**Mac:**
1. Download **Microsoft Remote Desktop** from App Store
2. Add PC with your Render URL
3. Connect with credentials

**Linux:**
```bash
remmina
# Or
xfreerdp /v:rdp-server-xxxx.onrender.com:3389 /u:rdpuser
```

---

## 🧪 Local Testing

Before deploying to Render, test locally:

```bash
# Copy environment file
cp .env.example .env

# Edit .env with your credentials
nano .env

# Build and run
docker-compose up -d

# Check logs
docker-compose logs -f

# Connect to localhost:3389
```

---

## 📊 Render Plans Comparison

| Plan | Cost | Uptime | Resources |
|------|------|--------|-----------|
| **Free** | $0/month | On-demand (suspends after 15 min) | 512 MB RAM |
| **Starter** | $7/month | 24/7 | 512 MB RAM |
| **Standard** | $25/month | 24/7 | 2 GB RAM |
| **Pro** | $85/month | 24/7 | 4 GB RAM |

> ⚠️ **Note:** Free tier suspends after inactivity. For true 24/7, use Starter plan or higher.

---

## 🔒 Security Best Practices

1. **Strong Passwords**: Use complex passwords with 16+ characters
2. **Change Default Credentials**: Never use default `rdpuser/ChangeMe123!`
3. **Firewall Rules**: Render provides DDoS protection by default
4. **Regular Updates**: Rebuild image monthly for security patches
5. **VPN Access**: Consider using Tailscale or Cloudflare Tunnel for extra security

---

## 🛠️ Customization

### Install Additional Software

Edit `Dockerfile` and add packages:
```dockerfile
RUN apt-get update && apt-get install -y \
    vlc \
    libreoffice \
    gimp \
    && apt-get clean
```

### Change Desktop Environment

Replace XFCE with another DE:
```dockerfile
# For GNOME
RUN apt-get install -y ubuntu-desktop

# For LXDE (lighter)
RUN apt-get install -y lxde
```

### Increase Resources

Edit `render.yaml`:
```yaml
plan: standard  # or pro
```

---

## 🆘 Troubleshooting

**Can't connect to RDP?**
- ✅ Check if service is running in Render dashboard
- ✅ Verify port is `:3389`
- ✅ Ensure password is correct (check environment variables)
- ✅ Try restarting the service

**Service keeps crashing?**
- Check logs in Render dashboard
- Verify Dockerfile builds successfully
- Ensure sufficient resources for your plan

**Slow performance?**
- Upgrade to Standard or Pro plan
- Reduce desktop effects in XFCE settings
- Close unnecessary applications

**Connection times out?**
- Render free tier suspends after 15 minutes
- Upgrade to Starter ($7/month) for 24/7 uptime

---

## 📝 Important Notes

1. **Render Limitations**: 
   - Free tier is NOT suitable for 24/7 (suspends after inactivity)
   - Use Starter plan minimum for 24/7 access
   
2. **Performance**:
   - This is Linux Ubuntu with XFCE, not Windows
   - Some Windows apps won't work
   - Use Wine for Windows compatibility

3. **Persistence**:
   - User data is stored in `/home/rdpuser`
   - Persistent disk is configured in `render.yaml`
   - Data survives redeployments

4. **Costs**:
   - Starter plan: ~$7/month for 24/7
   - Additional costs for more resources
   - Bandwidth is unlimited on all plans

---

## 🔗 Useful Resources

- [Render Documentation](https://render.com/docs)
- [Docker RDP Best Practices](https://docs.docker.com/)
- [XFCE Desktop Guide](https://docs.xfce.org/)
- [RDP Security Tips](https://learn.microsoft.com/en-us/windows-server/remote/remote-desktop-services/clients/remote-desktop-allow-access)

---

## 📜 License

MIT License - Feel free to modify and distribute!

---

## 🤝 Contributing

PRs welcome! Feel free to:
- Add more desktop environments
- Improve security
- Optimize performance
- Add pre-installed software

---

**Enjoy your 24/7 RDP server!** 🎉

For issues or questions, check Render logs or open an issue on GitHub.
