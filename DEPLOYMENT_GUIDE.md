# 📘 Complete Deployment Guide

## 🎯 Prerequisites

Before you begin, ensure you have:
- ✅ GitHub account
- ✅ Render account (sign up at [render.com](https://render.com))
- ✅ Git installed on your computer
- ✅ RDP client (built-in on Windows, downloadable for Mac/Linux)

---

## 📦 Step-by-Step Deployment

### 1️⃣ Prepare Your GitHub Repository

```bash
# Navigate to the docker-rdp-render folder
cd c:\Users\yuggu\Downloads\rdp\docker-rdp-render

# Initialize git (if not already done)
git init

# Add all files
git add .

# Commit
git commit -m "Initial commit: Docker RDP server for Render"

# Create a new repository on GitHub
# Then connect it:
git remote add origin https://github.com/YOUR-USERNAME/docker-rdp-render.git
git branch -M main
git push -u origin main
```

### 2️⃣ Deploy to Render

#### Option A: Using Blueprint (Recommended)

1. Login to [Render Dashboard](https://dashboard.render.com/)
2. Click **"New +"** → **"Blueprint"**
3. Connect your GitHub account (if not already connected)
4. Select your `docker-rdp-render` repository
5. Click **"Apply"**
6. Render will detect `render.yaml` and configure everything automatically

#### Option B: Manual Setup

1. Click **"New +"** → **"Web Service"**
2. Connect your repository
3. Configure:
   - **Name**: `rdp-server`
   - **Environment**: `Docker`
   - **Region**: `Oregon` (or closest to you)
   - **Branch**: `main`
   - **Plan**: `Starter` ($7/month for 24/7)
4. Add Environment Variables:
   - `RDP_USER`: `rdpuser` (or your choice)
   - `RDP_PASSWORD`: `Your-Secure-Password-123!`
5. Click **"Create Web Service"**

### 3️⃣ Wait for Deployment

- Initial deployment takes **5-10 minutes**
- Watch the build logs in Render dashboard
- Status will change from **"Building"** → **"Live"**

### 4️⃣ Get Your Connection URL

Once deployed:
1. Go to your service page
2. Find the URL (e.g., `rdp-server-abc123.onrender.com`)
3. Note down your credentials:
   - **Host**: `rdp-server-abc123.onrender.com`
   - **Port**: `3389`
   - **Username**: Your `RDP_USER`
   - **Password**: Your `RDP_PASSWORD`

---

## 🔌 Connecting to Your RDP Server

### Windows

1. Press `Win + R`
2. Type `mstsc` and press Enter
3. Enter: `rdp-server-abc123.onrender.com:3389`
4. Click **"Connect"**
5. Enter username and password
6. Accept any certificate warnings

### macOS

1. Download **Microsoft Remote Desktop** from Mac App Store
2. Open the app
3. Click **"+"** → **"Add PC"**
4. Enter:
   - **PC Name**: `rdp-server-abc123.onrender.com:3389`
   - **User Account**: Add your credentials
5. Click **"Add"**
6. Double-click to connect

### Linux

```bash
# Using Remmina (GUI)
sudo apt install remmina remmina-plugin-rdp
remmina

# Using xfreerdp (CLI)
sudo apt install freerdp2-x11
xfreerdp /v:rdp-server-abc123.onrender.com:3389 /u:rdpuser /p:YourPassword
```

---

## 🔄 Updating Your Server

### Update Software in Container

1. Connect via RDP
2. Open terminal in desktop
3. Run:
   ```bash
   sudo apt update
   sudo apt upgrade -y
   ```

### Update Docker Image

1. Modify `Dockerfile` locally
2. Commit and push:
   ```bash
   git add Dockerfile
   git commit -m "Update RDP server configuration"
   git push
   ```
3. Render will auto-deploy (if auto-deploy is enabled)
4. Or manually click **"Manual Deploy"** → **"Deploy latest commit"**

---

## 💰 Cost Breakdown

### Render Pricing (as of 2024)

| Plan | Monthly Cost | RAM | Uptime |
|------|-------------|-----|--------|
| **Free** | $0 | 512 MB | Suspends after 15 min idle |
| **Starter** | $7 | 512 MB | 24/7 |
| **Standard** | $25 | 2 GB | 24/7 |
| **Pro** | $85 | 4 GB | 24/7 |

### Additional Costs

- **Disk Storage**: Included in plan (10 GB for Starter)
- **Bandwidth**: Unlimited on all plans
- **Build Minutes**: Unlimited

---

## 🔐 Security Hardening

### 1. Use Environment Secrets

In Render dashboard:
- Go to **Environment** tab
- Click **"Add Environment Variable"**
- Mark as **"Secret"** (won't show in logs)

### 2. Enable Auto-Deploy Protection

- Go to **Settings** tab
- Disable **"Auto-Deploy"** for production
- Deploy manually after testing

### 3. Add IP Whitelist (Advanced)

Modify `Dockerfile` to add IP filtering:
```dockerfile
RUN apt-get install -y iptables

# Add to start.sh
iptables -A INPUT -p tcp --dport 3389 -s YOUR_IP -j ACCEPT
iptables -A INPUT -p tcp --dport 3389 -j DROP
```

### 4. Use SSH Tunnel (Extra Security)

Instead of direct RDP:
```bash
# On your local machine
ssh -L 3389:localhost:3389 user@render-server.onrender.com

# Then connect RDP to localhost:3389
```

---

## 📊 Monitoring

### View Logs

1. Go to service in Render dashboard
2. Click **"Logs"** tab
3. Watch real-time logs

### Check Resources

1. Click **"Metrics"** tab
2. Monitor:
   - CPU usage
   - Memory usage
   - Network traffic

### Set Up Alerts

1. Go to **Settings** → **"Notifications"**
2. Add email for deploy failures
3. Set up health check alerts

---

## 🐛 Common Issues & Solutions

### Issue: "Connection Refused"

**Solution:**
```bash
# Check if service is running
# In Render logs, look for:
# "RDP SERVER READY"

# If not, restart service:
# Render Dashboard → Service → "Manual Deploy" → "Clear build cache & deploy"
```

### Issue: "Wrong Password"

**Solution:**
```bash
# Check environment variables
# Render Dashboard → Environment tab
# Verify RDP_PASSWORD is set correctly

# Or check logs for auto-generated password
```

### Issue: "Slow Performance"

**Solution:**
1. Upgrade to Standard or Pro plan
2. In RDP session:
   - Settings → Appearance → Disable Desktop Effects
   - Close unnecessary apps
3. Optimize Docker image (remove unused packages)

### Issue: "Service Suspends on Free Tier"

**Solution:**
- Free tier suspends after 15 min inactivity
- Upgrade to **Starter plan** ($7/month) for 24/7

---

## 🚀 Advanced Features

### Add VNC Access

Edit `Dockerfile`:
```dockerfile
RUN apt-get install -y x11vnc
EXPOSE 5900
```

### Install Windows Apps (Wine)

```dockerfile
RUN apt-get install -y wine wine64
```

### Add File Sharing

```dockerfile
RUN apt-get install -y samba
EXPOSE 445
```

### Custom Desktop Background

Add to `Dockerfile`:
```dockerfile
COPY wallpaper.jpg /usr/share/backgrounds/
RUN chown -R ${RDP_USER}:${RDP_USER} /usr/share/backgrounds/
```

---

## 📞 Support

- **Render Support**: [render.com/support](https://render.com/support)
- **GitHub Issues**: Create issue in your repository
- **Community**: [Render Community Forum](https://community.render.com)

---

## ✅ Post-Deployment Checklist

- [ ] Service is **"Live"** in Render
- [ ] Can connect via RDP successfully
- [ ] Changed default password
- [ ] Tested basic desktop operations
- [ ] Set up auto-deploy (or disabled for safety)
- [ ] Configured environment secrets
- [ ] Enabled monitoring/alerts
- [ ] Bookmarked connection details
- [ ] Documented custom changes

---

**🎉 Congratulations! Your 24/7 RDP server is running!**

For more help, check the main [README.md](README.md) or Render documentation.
