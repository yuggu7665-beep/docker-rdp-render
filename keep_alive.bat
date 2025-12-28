@echo off
REM ========================================
REM   Keep Render RDP Server Awake
REM   Pings every 10 minutes to prevent sleep
REM ========================================

set /p RENDER_URL="Enter your Render service URL (e.g., rdp-server-abc.onrender.com): "

if "%RENDER_URL%"=="" (
    echo Error: No URL provided!
    pause
    exit /b
)

echo.
echo ========================================
echo   Keep-Alive Service Started
echo ========================================
echo.
echo Target: https://%RENDER_URL%
echo Ping Interval: Every 10 minutes
echo.
echo This will keep your FREE Render instance awake!
echo Press Ctrl+C to stop
echo.
echo ========================================
echo.

:loop
echo [%date% %time%] Pinging server...
curl -s https://%RENDER_URL% > nul 2>&1

if %errorlevel%==0 (
    echo [%date% %time%] ✓ Server is awake
) else (
    echo [%date% %time%] ⚠ Ping failed - server might be starting
)

echo [%date% %time%] Waiting 10 minutes until next ping...
timeout /t 600 /nobreak > nul

goto loop
