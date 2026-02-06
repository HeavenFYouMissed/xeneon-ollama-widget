@echo off
REM ========================================================
REM  Ollama CORS-Enabled Widget Launcher
REM  Universal script for Corsair Xeneon Edge Widget
REM ========================================================

echo.
echo ================================================
echo  Starting Ollama with CORS for Local Widget
echo ================================================
echo.

REM Check if Ollama is installed
where ollama >nul 2>nul
if %ERRORLEVEL% NEQ 0 (
    echo [ERROR] Ollama is not installed or not in PATH!
    echo.
    echo Please install Ollama from: https://ollama.com
    echo.
    pause
    exit /b 1
)

echo [INFO] Ollama found!
echo.

REM Kill any existing Ollama process
echo [INFO] Stopping any existing Ollama process...
taskkill /F /IM ollama.exe >nul 2>nul
timeout /t 2 /nobreak >nul

REM Set CORS environment variable to allow all origins
echo [INFO] Setting CORS to allow widget access...
set OLLAMA_ORIGINS=*

REM Start Ollama serve with CORS enabled
echo [INFO] Starting Ollama server on http://127.0.0.1:11434
echo [INFO] CORS enabled for all origins
echo.
echo ================================================
echo  Ollama is running! You can now use the widget.
echo  Press CTRL+C to stop the server.
echo ================================================
echo.

ollama serve
