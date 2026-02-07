# Social Push Skill

中文 | [English](./README_EN.md)

一个用于 AI 编程助手的社交媒体发布技能，基于 [agent-browser](https://github.com/anthropics/agent-browser) 实现自动化发布内容到各大社交平台。


## 💡 Why?

**claude code + bash + --help + skills**

传统脚本难以应对页面复杂变化，playwright mcp 消耗大量 tokens 且慢  
agent-browser 解析交互 ref 减少 tokens 消耗  
在 bash 中的 agent-browser 使用 `--help` 很好得到提示，运行更快  
self-evolution 方便维护，页面变化后可自行修复  
与 claude code 沟通用户需求，动态生成发布内容


## ✨ Features

- 🚀 **一句话发布内容** - 在 Claude Code 中输入 `/social-push 把这篇文章发到小红书`，AI 自动完成所有操作
- 🧠 **AI 驱动的智能交互** - 无需硬编码选择器，AI 自动理解页面元素，抗改版能力强
- 🔄 **Self-Evolution（自我进化）** - 网页改版后可自动检测并修复 workflow，无需手动维护代码
- 📝 **Markdown 即配置** - 添加新平台只需创建一个 markdown 文件，无需编写复杂脚本
- 🔐 **自动保存登录状态** - 使用 `--state` 参数保持会话，一次登录永久有效
- 👀 **可视化操作** - 浏览器对用户可见（`--headed` 模式），方便调试和监控
- 🛡️ **安全设计** - 仅暂存草稿，不自动发布，由用户最终确认
- 🎯 **多平台支持** - 已支持小红书（图文/长文）、X/Twitter，轻松扩展更多平台


## 🌐 支持平台

一句话添加一个新平台

| 平台 | 内容类型 | 状态 |
|------|----------|------|
| 小红书 | 图文 | ✅ |
| 小红书 | 长文 | ✅ |
| X (Twitter) | 推文 | ✅ |

more and more...


## 📦 安装

tips: 直接将下面内容复制给 claude code 执行即可安装

### 前置依赖

1. 安装 Claude Code
2. 安装 agent-browser 和 Chromium 浏览器
```bash
npm install -g agent-browser # agent-browser CLI tool
npx skills add https://github.com/vercel-labs/agent-browser --skill agent-browser # 安装 agent-browser skill
agent-browser install  # Download Chromium
```

### 安装 Skill

推荐使用 npx 安装：
```bash
npx skills add jihe520/social-push
```

或手动复制 `.claude/skills/social-push` 目录到你的项目中。

## 🚀 使用方法

在 Claude Code 中 **手动** /social-push 命令 即可

## ⚙️ 自定义

修改 [SKILL.md](./social-push/SKILL.md) 的 `# Rules` 部分可以自定义关键参数

## 📁 目录结构

```
social-push/
├── SKILL.md                    # 技能定义文件
└── references/
    ├── 小红书图文.md            # 小红书图文发布流程
    ├── 小红书长文.md            # 小红书长文发布流程
    ├── X推文.md                 # X/Twitter推文发布流程
    └── more...                  # 未来可添加更多平台
```

## 🔑 首次登录

关于登录状态和浏览器选择
有很多方式
连接自己的浏览器 chrome / edge vs 连接下载的浏览器 playweight chromium testing
chromium testing: 有的网站不能直接使用 agent-browser 登录，需手动滑
-- state ~/my-state.json: 使用状态文件保存登录状态，但文章草稿不保存
-- profile ~/my-profile: 使用浏览器用户数据目录，登录状态和草稿都保存，但可能有兼容性问题


建议手动完成初始化登录
部分平台必须要手动登录一次以保存状态：

将下面 prompt 复制给 claude code 执行：

```
有些网站不能直接使用自动化登录，需要手动登录后保存状态
请按照以下步骤操作：
找到该`ms-playwright  Google Chrome for Testing.app`的位置
查看指南 `agent-browser --help`
打开浏览器 `open "path" --args --remote-debugging-port=9222`
连接浏览器 `sleep 2 && curl -s http://localhost:9222/json/version`
`agent-browser connect "ws://localhost:9222/devtools/browser/xxx"`
手动登录后保存状态 `agent-browser state save ~/my-state.json`

```


## 🔗 引用

- [Claude Code](https://docs.anthropic.com/en/docs/claude-code) - Anthropic 的 AI 编程助手
- [agent-browser](https://github.com/vercel-labs/agent-browser) - AI 驱动的浏览器自动化工具
- [Anthropic Skills](https://github.com/anthropics/skills) - Claude Code 的技能系统
- [Playwright](https://playwright.dev/) - agent-browser 底层使用的浏览器自动化框架



## 🤝 贡献指南

欢迎添加更多平台支持！参考 `references/` 目录下的现有 workflow 格式创建新平台的发布流程。
