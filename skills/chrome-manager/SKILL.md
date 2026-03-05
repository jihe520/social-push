---
name: chrome-manager
description: Unified Chrome browser management for WSL/Windows environments. Handles Chrome startup with correct paths, ports, and CDP connection. Use when other skills need Chrome automation.
---

# Chrome Manager

Centralized Chrome browser management for automation tasks in WSL/Windows environments.

## Purpose

Solves the WSL→Windows Chrome CDP connection issues:
- UNC path problems
- Debug port startup failures
- Profile path conflicts
- Random port instability

## Usage

```bash
# Start Chrome (handles WSL/Windows automatically)
bash scripts/start-chrome.sh

# Check Chrome status
bash scripts/check-chrome.sh

# Stop Chrome
bash scripts/stop-chrome.sh
```

## Configuration

- **Debug Port**: Fixed at 9334
- **Profile Path**: `C:\Users\haonan.eth\.x-browser-profile` (Windows)
- **Working Directory**: `C:\` (Windows)
- **Launch Method**: PowerShell Start-Process (WSL→Windows)

## Integration

Other skills can use Chrome Manager by:

```bash
# Before automation
bash ~/.openclaw/workspace/skills/chrome-manager/scripts/start-chrome.sh

# Check if ready
bash ~/.openclaw/workspace/skills/chrome-manager/scripts/check-chrome.sh

# After automation
bash ~/.openclaw/workspace/skills/chrome-manager/scripts/stop-chrome.sh
```

## Environment Variables

- `CHROME_DEBUG_PORT`: Default 9334
- `CHROME_PROFILE_DIR`: Default `C:\Users\haonan.eth\.x-browser-profile`

## References

- Memory: WSL-Chrome-profile decision
- Memory: wsl-windows-chrome-launch principle
