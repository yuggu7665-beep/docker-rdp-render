# 🎴 Quick Reference Card - Docker RDP on Render

## 📋 Essential Info

**Service Name**: `docker-rdp-render`  
**Platform**: Render.com  
**OS**: Ubuntu 22.04 + XFCE Desktop  
**Port**: 3389 (RDP)  

---

## 🚀 Quick Commands

### Local Testing
```bash
# Start server
docker-compose up -d

# View logs
docker-compose logs -f

# Stop server
docker-compose down

# Rebuild
docker-compose up -d --build
```

### Git Operations
```bash
# Initial setup
git init
git add .
git commit -m "Initial commit"
git remote add origin YOUR_GITHUB_REPO_URL
git push -u origin main

# Update
git add .
git commit -m "Update"
git push
```

### Connect to RDP
```bash
# Windows
mstsc

# Mac
# Open Microsoft Remote Desktop app

# Linux
xfreerdp /v:YOUR_RENDER_URL:3389 /u:rdpuser /p:PASSWORD
```

---

## 🔑 Default Credentials

**Username**: `rdpuser`  
**Password**: Check Render environment variables  
**Port**: `3389`  

⚠️ **IMPORTANT**: Change default password before deploying!

---

## 💰 Pricing Quick Reference

| Plan | Cost/Month | RAM | Uptime |
|------|------------|-----|--------|
| Free | $0 | 512MB | Sleeps after idle |
| Starter | $7 | 512MB | **24/7** ⭐ |
| Standard | $25 | 2GB | 24/7 |
| Pro | $85 | 4GB | 24/7 |

**Recommendation**: Starter plan for true 24/7 access

---

## 🔗 Important URLs

**Render Dashboard**: https://dashboard.render.com  
**Documentation**: https://render.com/docs  
**Support**: https://render.com/support  

---

## 📁 File Structure

```
docker-rdp-render/
├── Dockerfile              # Main container configuration
├── docker-compose.yml      # Local testing setup
├── start.sh                # Container startup script
├── supervisord.conf        # Process manager config
├── render.yaml             # Render deployment config
├── .env.example            # Environment variables template
├── .gitignore              # Git ignore rules
├── README.md               # Main documentation
├── DEPLOYMENT_GUIDE.md     # Step-by-step deployment
├── COMPARISON.md           # CircleCI vs Render comparison
├── QUICK_START.bat         # Windows quick start
└── quick_start.sh          # Linux/Mac quick start
```

---

## ✅ Deployment Checklist

- [ ] Create GitHub repository
- [ ] Push code to GitHub
- [ ] Sign up for Render account
- [ ] Create new Blueprint service
- [ ] Connect GitHub repository
- [ ] Set environment variables
- [ ] Choose plan (Starter for 24/7)
- [ ] Wait for deployment (~10 min)
- [ ] Get service URL from dashboard
- [ ] Test RDP connection
- [ ] Change default password
- [ ] Bookmark connection details
- [ ] Set up monitoring/alerts
- [ ] Document custom changes

---

## 🆘 Troubleshooting Quick Fixes

### Can't Connect
```bash
# Check service status in Render dashboard
# Verify port is 3389
# Restart service: Manual Deploy → Deploy Latest
```

### Wrong Password
```bash
# Check Render → Environment → RDP_PASSWORD
# Update if needed and redeploy
```

### Slow Performance
```bash
# Upgrade plan in Render dashboard
# Or reduce desktop effects in XFCE settings
```

### Service Suspended (Free Tier)
```bash
# Free tier suspends after 15 min idle
# Upgrade to Starter plan ($7/month)
```

---

## 🔐 Security Checklist

- [ ] Strong password (16+ chars)
- [ ] Environment secrets enabled
- [ ] Auto-deploy configured
- [ ] Regular security updates
- [ ] Monitor access logs
- [ ] Consider VPN/tunnel access
- [ ] Keep local backup of data

---

## 📞 Getting Help

1. **Check logs**: Render Dashboard → Logs tab
2. **Read docs**: README.md & DEPLOYMENT_GUIDE.md
3. **Compare setups**: COMPARISON.md
4. **Render support**: Create ticket in dashboard
5. **Community**: Render Community Forum

---

## 🎯 Common Tasks

### Update Software in Container
```bash
# Connect via RDP, open terminal:
sudo apt update && sudo apt upgrade -y
```

### Add Custom Software
```dockerfile
# Edit Dockerfile, add to RUN command:
RUN apt-get install -y YOUR_PACKAGE
# Commit, push, redeploy
```

### Backup Your Data
```bash
# Via RDP, files are in:
/home/rdpuser/

# Copy important files externally
```

### Monitor Resources
```bash
# Render Dashboard → Metrics tab
# Watch CPU, RAM, Network usage
```

---

## 🏆 Best Practices

✅ Always use strong passwords  
✅ Enable environment secrets  
✅ Regular security updates  
✅ Monitor resource usage  
✅ Keep external backups  
✅ Test before deploying  
✅ Document customizations  
✅ Use version control  

---

## 📊 Performance Optimization

1. **Reduce Desktop Effects**
   - XFCE Settings → Window Manager Tweaks
   - Disable compositor

2. **Close Unused Apps**
   - Keep only necessary programs running

3. **Upgrade Plan**
   - More RAM = Better Performance
   - Standard ($25) recommended for heavy use

4. **Optimize Docker Image**
   - Remove unused packages
   - Use multi-stage builds
   - Minimize layers

---

## 🎓 Learning Resources

- Docker Documentation: https://docs.docker.com
- XFCE Guide: https://docs.xfce.org
- Render Guides: https://render.com/docs/guides
- RDP Security: https://learn.microsoft.com/windows-server/remote

---

**🎉 Ready to deploy? Run `QUICK_START.bat` (Windows) or `quick_start.sh` (Linux/Mac)**

**Questions?** → Read DEPLOYMENT_GUIDE.md  
**Issues?** → Check Render logs first  
**Improvements?** → Contribute on GitHub!  

---

*Last Updated: December 2025*  
*Platform: Render.com*  
*License: MIT*
