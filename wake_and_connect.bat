@echo off
echo ========================================
echo   Wake Up FREE RDP Server
echo ========================================
echo.
echo Waking up your Render RDP server...
echo This may take 30-60 seconds...
echo.

REM Replace with your actual Render URL
set RENDER_URL=YOUR-SERVICE.onrender.com

echo Pinging server to wake it up...
curl -s https://%RENDER_URL% >nul 2>&1

echo.
echo Waiting for service to start (60 seconds)...
timeout /t 60 /nobreak

echo.
echo Server should be awake now!
echo Connecting to RDP...
echo.

REM Launch RDP connection
mstsc /v:%RENDER_URL%:3389

echo.
echo If connection fails, wait another minute and try again.
echo Free tier takes time to wake up!
pause
