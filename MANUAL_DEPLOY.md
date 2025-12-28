# 🚀 Manual Deployment to Render (Without Blueprint)

## Steps to Deploy Without Blueprint

### 1️⃣ Go to Render Dashboard
Open: https://dashboard.render.com/

### 2️⃣ Create New Web Service
Click **"New +"** → **"Web Service"** (NOT Blueprint)

### 3️⃣ Connect Repository
- **Connect GitHub** account if not already connected
- Select repository: **`yuggu7665-beep/docker-rdp-render`**
- Click **"Connect"**

### 4️⃣ Configure Service

Fill in these settings:

| Setting | Value |
|---------|-------|
| **Name** | `rdp-server` (or any name you prefer) |
| **Region** | `Oregon` (or closest to you) |
| **Branch** | `master` |
| **Environment** | Select **"Docker"** |
| **Dockerfile Path** | `./Dockerfile` |
| **Docker Build Context Directory** | `.` (root) |

### 5️⃣ Choose Plan

| Plan | Cost | RAM | Uptime |
|------|------|-----|--------|
| **Free** | $0 | 512 MB | Sleeps after idle ⚠️ |
| **Starter** | $7/month | 512 MB | **24/7** ⭐ RECOMMENDED |
| **Standard** | $25/month | 2 GB | 24/7 + Better performance |

> **Note**: Free tier will suspend after 15 minutes of inactivity. For true 24/7, use Starter plan.

### 6️⃣ Add Environment Variables

Click **"Advanced"** → **"Add Environment Variable"**

Add these:
- **Key**: `RDP_USER`
  - **Value**: `rdpuser` (or your preferred username)
  
- **Key**: `RDP_PASSWORD`
  - **Value**: `YourStrongPassword123!` (⚠️ Change this!)

### 7️⃣ Configure Port (IMPORTANT!)

In **"Advanced"** section:
- **Port**: `3389`

### 8️⃣ Enable Persistent Disk (Optional but Recommended)

If you want to save files permanently:
- Click **"Add Disk"**
- **Name**: `rdp-data`
- **Mount Path**: `/home/rdpuser`
- **Size**: `1 GB` (or more if needed)

### 9️⃣ Create Web Service

Click **"Create Web Service"**

### 🔟 Wait for Deployment

- Deployment takes **5-10 minutes**
- Watch the logs in Render dashboard
- Wait until status shows **"Live"**

---

## 📝 After Deployment

### Get Your Connection Details

1. In Render dashboard, find your service URL
2. It will look like: `rdp-server-xxxx.onrender.com`

### Connect via RDP

**Windows:**
```
1. Press Win + R
2. Type: mstsc
3. Enter: rdp-server-xxxx.onrender.com:3389
4. Username: rdpuser
5. Password: [Your password from env vars]
```

**Linux:**
```bash
xfreerdp /v:rdp-server-xxxx.onrender.com:3389 /u:rdpuser /p:YourPassword
```

**Mac:**
```
Use Microsoft Remote Desktop app
Add PC: rdp-server-xxxx.onrender.com:3389
```

---

## 🔍 Troubleshooting

### Service Won't Start?
- Check **Logs** tab in Render dashboard
- Verify Dockerfile builds successfully
- Ensure port 3389 is configured

### Can't Connect via RDP?
- Verify service is **"Live"** (not building/deploying)
- Check your credentials match environment variables
- Try restarting the service

### Connection Timeout?
- Free tier suspends after idle - upgrade to Starter
- Check if port 3389 is accessible
- Verify firewall settings

---

## 💡 Pro Tips

1. **Use Strong Password**: Never use default passwords in production
2. **Enable Auto-Deploy**: Automatically deploy when you push to GitHub
3. **Monitor Logs**: Regularly check logs for issues
4. **Set Up Alerts**: Get notified when service goes down

---

## 🔄 Updating Your Server

When you make changes to code:

```bash
git add .
git commit -m "Update configuration"
git push
```

Render will automatically rebuild and redeploy (if auto-deploy is enabled).

---

## 📊 Cost Estimate

**For TRUE 24/7 Access:**
- Recommended: **Starter Plan** = **$7/month**
- Includes: 512 MB RAM, 10 GB storage, unlimited bandwidth
- Auto-restarts, persistent disk, no sleep

**Free Tier:**
- $0/month but suspends after 15 minutes of inactivity
- Not recommended for 24/7 use

---

**Need help?** Check the main [README.md](README.md) or [DEPLOYMENT_GUIDE.md](DEPLOYMENT_GUIDE.md)
