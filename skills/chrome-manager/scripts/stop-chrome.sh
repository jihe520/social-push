#!/bin/bash
# Chrome Manager - Stop Chrome

CHROME_DEBUG_PORT="${CHROME_DEBUG_PORT:-9334}"

echo "🛑 Stopping Chrome..."

# Kill Chrome processes on Windows
/mnt/c/Windows/System32/WindowsPowerShell/v1.0/powershell.exe -Command "Get-Process chrome -ErrorAction SilentlyContinue | Stop-Process -Force"

# Wait a moment
sleep 2

# Verify Chrome is stopped
if curl -s "http://127.0.0.1:${CHROME_DEBUG_PORT}/json/version" > /dev/null 2>&1; then
    echo "⚠️ Chrome may still be running"
    exit 1
else
    echo "✅ Chrome stopped"
    exit 0
fi
