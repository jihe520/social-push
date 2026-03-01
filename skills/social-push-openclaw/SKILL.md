# Social Push (OpenClaw)

社交媒体自动发布 skill — OpenClaw 版本。

基于 [social-push](../social-push/) 的 workflow，使用 OpenClaw 内置的 `browser` tool 替代 `agent-browser` CLI，无需额外安装依赖。

## 适用场景

当用户需要发布内容、推送文章、发帖到社交平台时使用此 skill。

## 环境要求

- [OpenClaw](https://github.com/openclaw/openclaw) 已安装并运行
- OpenClaw 的 `browser` tool 可用（内置，无需额外安装）
- 目标平台已在浏览器中登录

## 与原版区别

| 功能 | 原版 (Claude Code) | OpenClaw 版 |
|------|-------------------|-------------|
| 浏览器控制 | `agent-browser` CLI | OpenClaw `browser` tool |
| 页面快照 | `agent-browser snapshot -i` | `browser(action=snapshot)` |
| 点击元素 | `agent-browser click @ref` | `browser(action=act, request={kind:click, ref:ref})` |
| 输入文本 | `agent-browser fill @ref "text"` | `browser(action=act, request={kind:fill, ref:ref, text:text})` |
| 文件上传 | `agent-browser upload @ref "path"` | `browser(action=upload, paths:[path], ref:ref)` |
| 打开页面 | `agent-browser open "url"` | `browser(action=navigate, targetUrl:url)` |
| 运行环境 | 本地 Claude Code | 远程/本地 OpenClaw agent |

## Rules

1. 最终操作只能是**暂存草稿**，禁止自动点击"发布"按钮，由用户自行确认发布
2. 每步操作后用 `browser(action=snapshot)` 确认元素状态，页面变化可能导致 ref 编号变化
3. 使用 `refs="aria"` 获取稳定的 aria-ref id，跨调用更可靠

## Core Workflow

1. **确认发布信息**：目标平台、内容类型、内容来源（文件/直接输入/AI 创作）、标题、话题标签
2. **启动浏览器**：`browser(action=start)` 或连接已有浏览器
3. **读取 workflow**：读取 references 中对应平台的 workflow 文件
4. **逐步执行**：严格按照 workflow 步骤操作，每步 snapshot 确认

## Self-evolution

当 workflow 步骤失效时：
1. 运行 `browser(action=snapshot)` 查看当前页面元素
2. 运行 `browser(action=act, request={kind:evaluate, fn:"js code"})` 查看具体 HTML
3. 验证正确路径后，更新 references 下对应的 workflow 文件

## References

### 小红书
- [小红书图文](./references/小红书图文.md)
- [小红书长文](./references/小红书长文.md)

### X (Twitter)
- [X推文](./references/X推文.md)

### 微博
- [微博](./references/微博.md)

### 微信公众号
- [微信公众号文章](./references/微信公众号文章.md)

### 掘金
- [掘金文章](./references/掘金文章.md)

### 知乎
- [知乎想法](./references/知乎想法.md)
