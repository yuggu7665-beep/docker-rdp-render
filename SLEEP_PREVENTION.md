# 🔄 FREE TIER SLEEP PREVENTION GUIDE

## Problem: Render FREE Tier Sleeps After 15 Minutes

Render's free tier **automatically suspends your service** after 15 minutes of inactivity to save resources.

**Result**: 50+ second delay when reconnecting to RDP!

---

## ✅ Solutions to Keep Server Awake

I've implemented **multiple solutions** for you:

### 🔧 Built-in Solution (Already Done!)

**HTTP Health Endpoint** - Added to your Docker container:
- Server now runs HTTP on port **8000**
- Responds to pings automatically
- Works with external monitoring services

**What I Changed:**
- ✅ Added Python3 to Dockerfile
- ✅ Created HTTP server in `start.sh`
- ✅ Exposed port 8000

---

### 🖥️ Option 1: Run Keep-Alive Script on Your PC

**Use `keep_alive.bat`** (created for you):

1. Double-click **`keep_alive.bat`**
2. Enter your Render URL
3. Leave it running in background
4. It pings every **10 minutes**

**Pros:**
- ✅ Completely free
- ✅ Simple to use
- ✅ Works from your PC

**Cons:**
- ❌ Your PC must stay on
- ❌ Stops if you close the window

---

### 🌐 Option 2: Use FREE External Monitoring (RECOMMENDED!)

**UptimeRobot** - Free monitoring service:

1. Go to: https://uptimerobot.com/
2. Sign up (FREE account)
3. Click **"Add New Monitor"**
4. Settings:
   - **Monitor Type**: HTTP(s)
   - **Friendly Name**: RDP Server Keep-Alive
   - **URL**: `https://your-service.onrender.com`
   - **Monitoring Interval**: 5 minutes (FREE tier)
5. Click **"Create Monitor"**

**How it works:**
- UptimeRobot pings your server every 5 minutes
- Keeps your Render instance awake 24/7
- Completely automatic!
- You get email alerts if it goes down

**Pros:**
- ✅ 100% automatic
- ✅ Works 24/7
- ✅ Free forever
- ✅ Email alerts included
- ✅ No need to keep your PC on

**Cons:**
- ✅ None! This is the best option!

---

### 🔔 Option 3: Cron-Job.org (Alternative)

Another free service:

1. Go to: https://cron-job.org/
2. Sign up (FREE)
3. Create new cron job:
   - **URL**: `https://your-service.onrender.com`
   - **Interval**: Every 10 minutes
4. Save and activate

---

### 🤖 Option 4: GitHub Actions (Advanced)

If you know GitHub Actions:

```yaml
name: Keep Render Awake
on:
  schedule:
    - cron: '*/10 * * * *'  # Every 10 minutes
jobs:
  ping:
    runs-on: ubuntu-latest
    steps:
      - name: Ping Server
        run: curl https://your-service.onrender.com
```

---

## 📊 Comparison of Solutions

| Solution | Cost | Setup Time | Reliability | PC Required |
|----------|------|------------|-------------|-------------|
| **keep_alive.bat** | FREE | 1 minute | Medium | ✅ Yes |
| **UptimeRobot** | FREE | 3 minutes | Excellent | ❌ No |
| **Cron-Job.org** | FREE | 3 minutes | Excellent | ❌ No |
| **GitHub Actions** | FREE | 10 minutes | Good | ❌ No |

**🏆 WINNER: UptimeRobot** (FREE, automatic, reliable, no PC needed!)

---

## 🚀 Quick Setup - UptimeRobot (Recommended)

### Step 1: Deploy Your Server
Complete your Render deployment first

### Step 2: Get Your URL
After deployment, copy your service URL (e.g., `rdp-server-abc.onrender.com`)

### Step 3: Setup UptimeRobot
1. Visit: https://uptimerobot.com/signup/
2. Sign up (FREE - no credit card!)
3. Click "+ Add New Monitor"
4. Fill in:
   ```
   Monitor Type: HTTP(s)
   Friendly Name: RDP Keep-Alive
   URL: https://rdp-server-abc.onrender.com
   Monitoring Interval: 5 minutes
   ```
5. Click "Create Monitor"

### Step 4: Done! ✅
Your server will now stay awake 24/7!

---

## 🔍 How to Verify It's Working

### Check Server Status:
Visit in browser: `https://your-service.onrender.com:8000`

You should see:
```
✅ RDP Server is ALIVE!
Status: Running
Time: [current time]
```

### Check UptimeRobot:
- Green = Server is up
- Uptime percentage should be 99%+

---

## 💡 Best Practice Strategy

**For TRUE 24/7 FREE Access:**

1. ✅ Deploy to Render (FREE plan)
2. ✅ Setup UptimeRobot monitoring (5 min interval)
3. ✅ Optionally run `keep_alive.bat` when using RDP
4. ✅ Your server stays awake with ZERO cost!

**Alternative:**
- Use CircleCI for Windows (6 hours/session, 100 hrs/month)
- See `circleci-rdp-setup/` folder

---

## ⚠️ Important Notes

### Free Tier Limitations:
- Even with keep-alive, Render may occasionally restart your service
- First connection might take 30-60 seconds
- Files may be lost on restart (backup important data!)

### For Production/Critical Use:
- Consider upgrading to **Starter plan** ($7/month)
- True 24/7 with no sleep
- Faster performance
- Guaranteed uptime

---

## 🆘 Troubleshooting

**Server still sleeping?**
- Check UptimeRobot is active (green status)
- Verify URL is correct
- Try reducing interval to 5 minutes

**Can't access port 8000?**
- That's OK! Render might not expose it publicly
- The important thing is the HTTP requests wake the service

**Need immediate access?**
- Visit your Render URL in browser
- Wait 60 seconds
- Then connect via RDP

---

## 📖 Files Updated

All changes have been made to keep your server awake:

1. ✅ `Dockerfile` - Added Python3
2. ✅ `start.sh` - Added HTTP health server
3. ✅ `keep_alive.bat` - Local keep-alive script
4. ✅ This guide - `SLEEP_PREVENTION.md`

---

**🎯 Next Steps:**

1. **Deploy**: Complete your Render deployment
2. **Setup**: Configure UptimeRobot (3 minutes)
3. **Connect**: Use RDP - server stays awake!

**Questions?** Check other guides or Render documentation.

**🎉 Enjoy your FREE 24/7 RDP server!**

*With UptimeRobot, your FREE Render instance will stay awake continuously!*
