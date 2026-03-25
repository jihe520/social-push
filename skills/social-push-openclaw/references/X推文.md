## 发布推文 workflow (OpenClaw)

1. 打开 X 发布页面：`browser(action=navigate, targetUrl="https://x.com/compose/post")`
2. 查看交互元素：`browser(action=snapshot, refs="aria")`
3. 输入推文内容：`browser(action=act, request={kind:fill, ref:"推文输入框ref", text:"{推文内容}"})`
4. （可选）上传图片：`browser(action=upload, ref:"文件上传ref", paths:["{图片路径}"])`
5. 等待上传完成：`browser(action=act, request={kind:wait, timeMs:2000})`
6. 查看当前状态：`browser(action=snapshot, refs="aria")`
7. 保存草稿：`browser(action=act, request={kind:click, ref:"草稿按钮ref"})`
8. 提示用户手动确认发布，不自动点击"发帖"按钮

## 注意事项

- 推文字数限制：普通用户 **280 字符**，Premium 用户更多
- 图片支持格式：JPG、PNG、GIF，最多 4 张图片
- 添加话题标签：直接在推文内容中加入 `#话题`
- 每步操作后用 `browser(action=snapshot)` 确认元素 ref，页面变化可能导致 ref 变化
