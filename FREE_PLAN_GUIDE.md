# 🆓 FREE PLAN DEPLOYMENT GUIDE

## ⚠️ Important: Free Plan Limitations

**Render Free Tier:**
- ✅ **$0/month** - No credit card required
- ✅ **512 MB RAM** - Enough for basic desktop use
- ⚠️ **Suspends after 15 minutes** of inactivity
- ⚠️ **Spin-up time**: 30-60 seconds when you reconnect
- ⚠️ **NOT true 24/7** - Goes to sleep when idle

**Best For:**
- On-demand RDP access (not 24/7)
- Testing and learning
- Short-term tasks
- Budget-conscious users

**NOT Good For:**
- Running bots/scripts 24/7
- Continuous background processes
- Instant access (has wake-up delay)

---

## 🚀 Deploy on FREE Plan - Step by Step

### 1️⃣ Go to Render Dashboard
https://dashboard.render.com/

### 2️⃣ Create Web Service
- Click **"New +"** → **"Web Service"**
- **DON'T** select Blueprint

### 3️⃣ Connect Repository
- Connect your GitHub account
- Select: **`yuggu7665-beep/docker-rdp-render`**
- Branch: **`master`**

### 4️⃣ Configure Service

| Setting | Value |
|---------|-------|
| Name | `rdp-server-free` |
| Region | `Oregon` (or closest) |
| Environment | **Docker** |
| Plan | **Free** ⭐ |

### 5️⃣ Add Environment Variables (IMPORTANT!)

Click **"Advanced"** → **"Add Environment Variable"**

```
RDP_USER = rdpuser
RDP_PASSWORD = YourSecurePassword123!
```

⚠️ **Change the password!** Never use default passwords.

### 6️⃣ Deploy!

Click **"Create Web Service"**

Wait 5-10 minutes for deployment.

---

## 🔌 Connecting to Your FREE RDP Server

### Get Your URL
After deployment, you'll get a URL like:
```
rdp-server-free.onrender.com
```

### Important: Wake-Up Process

**Free tier sleeps after 15 minutes of inactivity.**

To wake it up:
1. Visit the URL in browser first (it will wake the service)
2. Wait 30-60 seconds
3. Then connect via RDP

### Connect via RDP

**Windows:**
```
1. Press Win + R
2. Type: mstsc
3. Enter: rdp-server-free.onrender.com:3389
4. Username: rdpuser
5. Password: [Your password]
```

**First connection might timeout** - this is normal! The service is waking up.
- Wait 1-2 minutes
- Try connecting again

**Linux:**
```bash
xfreerdp /v:rdp-server-free.onrender.com:3389 /u:rdpuser /p:YourPassword
```

**Mac:**
Use Microsoft Remote Desktop app

---

## 💡 Pro Tips for FREE Plan

### Keep Your Session Active
To prevent suspension while working:
1. Keep moving the mouse/typing
2. Open a terminal and run:
   ```bash
   while true; do date; sleep 60; done
   ```
   This keeps activity going

### Automatic Wake-Up Script

Create `wake_rdp.bat` on your local PC:
```batch
@echo off
echo Waking up RDP server...
curl https://rdp-server-free.onrender.com
timeout /t 60
echo Ready! Connecting...
mstsc /v:rdp-server-free.onrender.com:3389
```

Run this before connecting - it wakes the server first!

### Data Persistence

⚠️ **Files may be lost** when service restarts!

To save important files:
1. Upload to cloud (Google Drive, Dropbox)
2. Git commit and push
3. Download to your local machine

---

## 🆚 FREE Plan vs CircleCI (Also Free)

| Feature | Render Free | CircleCI Free |
|---------|-------------|---------------|
| **Cost** | $0 | $0 |
| **OS** | Ubuntu/Linux | Windows Server |
| **Session Time** | Suspends after idle | 6 hours max |
| **Monthly Limit** | Unlimited* | 100 hours |
| **Wake-up Time** | 30-60 seconds | Manual restart |
| **Data Persistence** | ⚠️ Limited | ❌ None |
| **Credit Card** | Optional | ❌ Not needed |

*Unlimited but with sleep/wake cycles

**Recommendation**: 
- **Render Free**: For Linux, on-demand use
- **CircleCI**: For Windows, longer sessions (6h), see `circleci-rdp-setup/` folder

---

## 🔄 Upgrading from Free to Paid

Anytime you want true 24/7:

1. Go to Render Dashboard
2. Your service → **Settings**
3. Change plan to **Starter ($7/month)**
4. No reinstallation needed!

---

## 🐛 Troubleshooting FREE Plan

### "Connection Timed Out"
- Service is sleeping - wait 60 seconds and retry
- Visit URL in browser first to wake it up

### "Cannot Connect"
- Check if service is "Live" in dashboard
- Verify port 3389 is correct
- Ensure credentials match

### "Slow Performance"
- Free tier has limited resources
- Close unnecessary apps
- Consider upgrading to Starter

### Keep Getting Disconnected?
- Free tier suspends after inactivity
- Use wake-up tips above
- Or upgrade to Starter for 24/7

---

## 📊 Cost Comparison

**FREE Forever Option:**
```
Render Free + CircleCI Free = $0/month
- Use Render for Linux tasks (on-demand)
- Use CircleCI for Windows tasks (100h/month)
- Best of both worlds!
```

**For True 24/7:**
```
Render Starter = $7/month
- No sleep/wake delays
- Always ready to connect
- Better performance
```

---

## ✅ Quick Checklist for FREE Plan

- [ ] Deployed to Render (Free plan)
- [ ] Set strong password in env vars
- [ ] Got service URL
- [ ] Created wake-up script
- [ ] Tested connection
- [ ] Bookmarked important notes about sleep mode
- [ ] Set up cloud backup for files
- [ ] Understand 15-minute idle suspension

---

## 🎓 Learning Path

**Week 1**: Use Render Free to learn RDP basics
**Week 2**: Explore CircleCI for Windows access
**Week 3**: Decide if you need 24/7 (upgrade to Starter)

---

**Questions?** Check [README.md](README.md) or [MANUAL_DEPLOY.md](MANUAL_DEPLOY.md)

**Ready to deploy?** Follow steps 1-6 above!

🎉 **Enjoy your FREE RDP server!**

*Note: Free plan is perfect for learning and occasional use. For production/24-7, consider Starter plan.*
