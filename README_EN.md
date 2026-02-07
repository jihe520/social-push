# Social Push Skill

[中文](./README.md) | English

A social media publishing skill for AI programming assistants, based on [agent-browser](https://github.com/anthropics/agent-browser) to automate content publishing to major social platforms.


## 💡 Why?

**claude code + bash + --help + skills**

Traditional scripts struggle with complex page changes, playwright MCP consumes massive tokens and is slow  
agent-browser parses interaction refs to reduce token consumption  
Using `--help` with agent-browser in bash provides excellent hints and runs faster  
Self-evolution makes maintenance easy, automatically fixing workflows when pages change  
Communicates with Claude Code to understand user needs and dynamically generate publishing content


## ✨ Features

- 🚀 **One-Line Publishing** - Type `/social-push post this article to Xiaohongshu` in Claude Code, AI handles everything
- 🧠 **AI-Driven Smart Interaction** - No hardcoded selectors, AI understands page elements, strong resistance to page changes
- 🔄 **Self-Evolution** - Automatically detects and fixes workflows after page redesigns, no manual code maintenance
- 📝 **Markdown as Configuration** - Add new platforms by creating a markdown file, no complex scripts needed
- 🔐 **Auto-Save Login State** - Uses `--state` parameter to persist sessions, login once and use forever
- 👀 **Visual Operation** - Browser visible to users (`--headed` mode), easy debugging and monitoring
- 🛡️ **Safe Design** - Only saves drafts, never auto-publishes, user confirms final posting
- 🎯 **Multi-Platform Support** - Supports Xiaohongshu (images/articles), X/Twitter, easily extensible


## 🌐 Supported Platforms

Add a new platform in one sentence

| Platform | Content Type | Status |
|----------|--------------|--------|
| Xiaohongshu | Image Post | ✅ |
| Xiaohongshu | Article | ✅ |
| X (Twitter) | Tweet | ✅ |

more and more...


## 📦 Installation

Tips: Simply copy the content below to Claude Code for installation

### Prerequisites

1. Install Claude Code
2. Install agent-browser and Chromium browser
```bash
npm install -g agent-browser # agent-browser CLI tool
npx skills add https://github.com/vercel-labs/agent-browser --skill agent-browser # Install agent-browser skill
agent-browser install  # Download Chromium
```

### Install Skill

Recommended installation via npx:
```bash
npx skills add jihe520/social-push
```

Or manually copy the `.claude/skills/social-push` directory to your project.

## 🚀 Usage

Simply use the `/social-push` command manually in Claude Code

## ⚙️ Customization

Modify the `# Rules` section in [SKILL.md](./social-push/SKILL.md) to customize key parameters

## 📁 Directory Structure

```
social-push/
├── SKILL.md                    # Skill definition file
└── references/
    ├── 小红书图文.md            # Xiaohongshu image post workflow
    ├── 小红书长文.md            # Xiaohongshu article workflow
    ├── X推文.md                 # X/Twitter tweet workflow
    └── more...                  # More platforms to be added
```

## 🔑 First Login

Manual initialization login recommended
Some platforms require manual login once to save state:

Copy the prompt below to Claude Code and execute:

```
Some websites cannot use automated login directly, need to login manually and save state
Please follow these steps:
Find the location of `ms-playwright Google Chrome for Testing.app`
Check guide with `agent-browser --help`
Open browser `open "path" --args --remote-debugging-port=9222`
Connect browser `sleep 2 && curl -s http://localhost:9222/json/version`
`agent-browser connect "ws://localhost:9222/devtools/browser/xxx"`
Save state after manual login `agent-browser state save ~/my-state.json`

```


## 🔗 References

- [Claude Code](https://docs.anthropic.com/en/docs/claude-code) - Anthropic's AI programming assistant
- [agent-browser](https://github.com/vercel-labs/agent-browser) - AI-driven browser automation tool
- [Anthropic Skills](https://github.com/anthropics/skills) - Claude Code skill system
- [Playwright](https://playwright.dev/) - Browser automation framework used by agent-browser



## 🤝 Contributing

Welcome to add more platform support! Refer to existing workflow formats in the `references/` directory to create workflows for new platforms.
