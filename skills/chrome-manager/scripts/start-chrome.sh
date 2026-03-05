#!/bin/bash
# Chrome Manager - Start Chrome with correct WSL/Windows configuration

set -e

# Configuration
CHROME_DEBUG_PORT="${CHROME_DEBUG_PORT:-9334}"
CHROME_PROFILE_DIR="${CHROME_PROFILE_DIR:-C:\\Temp\\chrome-profile}"
CHROME_PATH="/mnt/c/Program Files/Google/Chrome/Application/chrome.exe"

echo "🚀 Starting Chrome Manager..."

# Check if Chrome is already running on port 9334
if curl -s "http://127.0.0.1:${CHROME_DEBUG_PORT}/json/version" > /dev/null 2>&1; then
    echo "✅ Chrome already running on port ${CHROME_DEBUG_PORT}"
    exit 0
fi

# Check if Chrome executable exists
if [ ! -f "$CHROME_PATH" ]; then
    echo "❌ Chrome not found at: $CHROME_PATH"
    exit 1
fi

echo "📂 Profile: ${CHROME_PROFILE_DIR}"
echo "🔌 Debug Port: ${CHROME_DEBUG_PORT}"

# Launch Chrome via PowerShell (WSL→Windows)
echo "🔧 Launching Chrome via PowerShell..."

# PowerShell command to start Chrome
/mnt/c/Windows/System32/WindowsPowerShell/v1.0/powershell.exe -Command "
    Start-Process -FilePath 'C:\\Program Files\\Google\\Chrome\\Application\\chrome.exe' \
        -ArgumentList '--remote-debugging-port=${CHROME_DEBUG_PORT}', \
                      '--user-data-dir=${CHROME_PROFILE_DIR}', \
                      '--no-first-run', \
                      '--no-default-browser-check', \
                      '--disable-blink-features=AutomationControlled' \
        -WorkingDirectory 'C:\\' \
        -WindowStyle Hidden
"

# Wait for Chrome to be ready
echo "⏳ Waiting for Chrome debug port..."
for i in {1..30}; do
    if curl -s "http://127.0.0.1:${CHROME_DEBUG_PORT}/json/version" > /dev/null 2>&1; then
        echo "✅ Chrome is ready on port ${CHROME_DEBUG_PORT}"
        exit 0
    fi
    sleep 1
done

echo "❌ Chrome failed to start within 30 seconds"
exit 1

