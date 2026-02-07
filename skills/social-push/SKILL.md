---
name: social-push
description: 使用 agent-browser 帮用户将内容发到社交媒体上。当用户需要发布内容、推送文章、上传文章、发帖到社交平台时使用此 skill。
disable-model-invocation: true
allowed-tools: Bash(agent-browser:*), Bash(jq:*), Bash(osascript:*) ,Read
---

用户输入 $ARGUMENTS

# Social-push Skill
你需要使用 bash 运行 agent-browser，并参考 references 中对应平台的 workflow，帮助用户将文章、图片上传到对应的社交平台上

# Rules
1. 必须使用 `--state ~/my-state.json` 参数，确保用户登录状态和历史记录被保留
2. 必须使用 `--headed` 参数，确保浏览器对用户可见
3. 最终操作只能是**暂存草稿**，禁止自动点击"发布"按钮，由用户自行确认发布
4. 每步操作后用 `agent-browser snapshot -i` 确认元素 ref，因为页面状态变化可能导致 ref 编号变化

# Core Workflow
1. 确认发布信息 调用 AskUserQuestion tool：目标平台、内容类型、内容来源（文件路径/直接输入/ai 创作）、标题、话题标签
2. 简单了解 `agent-browser --help` 可用命令
3. 读取 references 中对应平台和内容类型的 workflow
4. 严格按照 workflow 中的步骤逐步执行


# Self-evolution

## fix and verify Workflow
网页交互可能发生变化，references 下面的 workflow 可能失效，按以下步骤修复：
1. 运行 `agent-browser snapshot` 查看当前页面的详细元素
2. 当查找失败，运行 `agent-browser eval "js"` 查看具体 html 元素
3. 验证正确的交互路径后，编辑 references 下对应的 workflow 文件进行修正

## 添加新的社交平台
1. 参考 references 下已有的 workflow 作为模板
2. 用 `agent-browser --help` 查看可用命令
3. 在 references 目录下创建新平台的 workflow 文件，并在下方 References 中添加链接

# login
有些网站不能直接使用 agent-browser 登录
ms-playwright  Google Chrome for Testing.app

open "path" --args --remote-debugging-port=9222
sleep 2 && curl -s http://localhost:9222/json/version
agent-browser connect "ws://localhost:9222/devtools/browser/xxx
让用户手动登录
agent-browser state save ~/my-state.json

# References

## 小红书
- `小红书图文` ：查看[小红书图文](./references/小红书图文.md)发布简短文章图文时候需要的 workflow
- `小红书长文` ：查看[小红书长文](./references/小红书长文.md)用户发送长文本时候需要的 workflow

## X (Twitter)
- `X推文` ：查看[X推文](./references/X推文.md)发布推文时候需要的 workflow


