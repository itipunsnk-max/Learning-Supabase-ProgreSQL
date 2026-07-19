@echo off
setlocal
cd /d "%~dp0"

echo Starting the latest CMMS Documentation build...
powershell.exe -NoProfile -ExecutionPolicy Bypass -File "%~dp0scripts\start-docs.ps1"

if errorlevel 1 (
    echo.
    echo Failed to start CMMS Documentation.
    echo Check dev-server.error.log for details.
    pause
    exit /b 1
)

echo.
echo CMMS Documentation is ready at http://127.0.0.1:5173/
endlocal
