@echo off
echo ========================================
echo   Docker RDP Server - Quick Setup
echo ========================================
echo.

REM Check if git is initialized
if not exist .git (
    echo Initializing Git repository...
    git init
    git add .
    git commit -m "Initial commit: Docker RDP server for Render"
    echo.
    echo [SUCCESS] Git repository initialized!
    echo.
    echo NEXT STEPS:
    echo 1. Create a new repository on GitHub
    echo 2. Run this command with your repo URL:
    echo    git remote add origin https://github.com/YOUR-USERNAME/YOUR-REPO.git
    echo    git branch -M main
    echo    git push -u origin main
    echo.
    echo 3. Then deploy to Render following DEPLOYMENT_GUIDE.md
) else (
    echo Git repository already exists.
    echo.
    echo Choose an option:
    echo 1. Push changes to GitHub
    echo 2. View connection info
    echo 3. Open deployment guide
    echo.
    set /p choice="Enter your choice (1-3): "
    
    if "%choice%"=="1" (
        echo.
        echo Pushing changes to GitHub...
        git add .
        git commit -m "Update: %date% %time%"
        git push
        echo [SUCCESS] Changes pushed!
    )
    
    if "%choice%"=="2" (
        echo.
        echo ========================================
        echo   CONNECTION INFO
        echo ========================================
        echo After deploying to Render:
        echo.
        echo 1. Get your Render URL from dashboard
        echo 2. Connect using RDP client:
        echo    - Host: your-service.onrender.com:3389
        echo    - User: rdpuser (or custom)
        echo    - Pass: Check Render environment vars
        echo ========================================
    )
    
    if "%choice%"=="3" (
        start DEPLOYMENT_GUIDE.md
    )
)

echo.
pause
