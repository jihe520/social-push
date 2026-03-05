#!/bin/bash
# Chrome Manager - Check Chrome status

CHROME_DEBUG_PORT="${CHROME_DEBUG_PORT:-9334}"

if curl -s "http://127.0.0.1:${CHROME_DEBUG_PORT}/json/version" > /dev/null 2>&1; then
    echo "✅ Chrome is running on port ${CHROME_DEBUG_PORT}"
    exit 0
else
    echo "❌ Chrome is not running on port ${CHROME_DEBUG_PORT}"
    exit 1
fi
