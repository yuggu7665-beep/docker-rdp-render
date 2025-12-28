@echo off
cls
echo ========================================
echo   Connect to Render RDP Server
echo ========================================
echo.

REM Prompt for Render URL
set /p RENDER_URL="Enter your Render service URL (e.g., rdp-server-abc.onrender.com): "

if "%RENDER_URL%"=="" (
    echo Error: No URL provided!
    pause
    exit /b
)

echo.
echo ========================================
echo   Connection Details
echo ========================================
echo.
echo Host: %RENDER_URL%:3389
echo Username: rdpuser (or what you set in RDP_USER)
echo Password: Your password from Render env vars
echo.
echo ========================================
echo.

REM For FREE plan - wake up the service first
echo [1/2] Waking up FREE tier service (if applicable)...
curl -s https://%RENDER_URL% >nul 2>&1
echo Done!
echo.

echo [2/2] Waiting 30 seconds for service to wake up...
timeout /t 30 /nobreak
echo.

echo ========================================
echo   Launching RDP Connection...
echo ========================================
echo.
echo If connection fails:
echo 1. Wait another minute (FREE tier needs time to wake)
echo 2. Check your Render dashboard - is service "Live"?
echo 3. Verify your password matches Render env vars
echo.

REM Launch RDP
mstsc /v:%RENDER_URL%:3389

echo.
pause
