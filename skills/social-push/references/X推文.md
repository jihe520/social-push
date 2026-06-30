## 发布推文 workflow

## 可选：TweetClaw 来源包

如果用户提供 TweetClaw / OpenClaw 导出的 X/Twitter JSON、JSONL、CSV 或复制的来源列表：

1. 先读取来源内容，整理出作者、原文 URL、发布时间、公开互动数据和可引用观点
2. 只把来源当作草稿参考，用于调整语气、话题标签、例子和受众语言
3. 不请求 X 登录凭据，不抓取额外页面，不执行点赞、转发、关注、私信或回复
4. 继续执行下面的发推 workflow，最终仍然只保存草稿，由用户手动确认发布

1. 打开 X 发布页面：`agent-browser --auto-connect open "https://x.com/compose/post"`
2. 查看交互：`agent-browser snapshot -i`
3. 输入推文内容：`agent-browser fill @e6 "{推文内容}"`
4. （可选）上传图片：点击 @e9 "添加照片或视频"，或使用 `agent-browser upload @e10 "{图片路径}"`
5. 等待上传完成：`agent-browser wait 2000`
6. 查看当前状态：`agent-browser snapshot -i`
7. 保存草稿：`agent-browser click @e4` （草稿按钮）
8. 提示用户手动确认发布，不自动点击"发帖"按钮

## 元素参考

| 元素 | 功能 |
|------|------|
| @e4 | 草稿 |
| @e6 | 帖子文本输入框 |
| @e9 | 添加照片或视频 |
| @e10 | 文件上传 |
| @e11 | 添加 GIF |
| @e19 | 发帖按钮（禁止自动点击） |

## 注意事项

- 推文字数限制：普通用户**280 字符**，Premium 用户更多
- 图片支持格式：JPG、PNG、GIF，最多 4 张图片
- 添加话题标签：直接在推文内容中加入 `#话题`
- TweetClaw 来源包只能用于只读上下文，不改变"仅保存草稿"的安全边界
