# 贡献指南 (Contributing to Nvim Pioneer)

感谢你为 Nvim Pioneer 贡献代码！本指南将帮助你快速上手开发流程。

## 📋 目录

- [行为准则](#行为准则)
- [开发环境搭建](#开发环境搭建)
- [代码规范](#代码规范)
- [提交规范](#提交规范)
- [Pull Request 流程](#pull-request-流程)
- [问题报告](#问题报告)

---

## 行为准则

本项目遵循 [Contributor Covenant](https://www.contributor-covenant.org/) 行为准则。请保持友好、尊重的交流氛围。

---

## 开发环境搭建

### 1. Fork 并克隆仓库

```bash
# 1. 在 GitHub 上 Fork 本仓库
# 2. 克隆到本地
git clone https://github.com/YOUR_USERNAME/nvim-pioneer.git
cd nvim-pioneer
```

### 2. 安装依赖

```bash
# 确保已安装 Neovim >= 0.9, Git, Node.js, Ripgrep, Python 3

# 可选：安装 pre-commit 钩子（推荐）
pip install pre-commit
pre-commit install
```

### 3. 测试配置

```bash
# 启动 Neovim 测试配置
nvim

# 同步插件（如有需要）
nvim --headless "+Lazy! sync" "+qa"
```

---

## 代码规范

### Lua 代码

- 使用 [StyLua](https://github.com/JohnnyMorganz/StyLua) 格式化
- 缩进：2 个空格
- 使用语义化变量名

**格式化代码：**

```bash
# 手动格式化
stylua --indent-width 2 lua/

# 或让 pre-commit 自动格式化
git commit -m "feat: your changes"
```

### Markdown 文档

- 使用 [Prettier](https://prettier.io/) 格式化
- 标题层级清晰
- 包含必要的代码示例

### Shell 脚本

- 遵循 [Shell Style Guide](https://google.github.io/styleguide/shellguide.html)
- 使用 `shfmt` 格式化

---

## 提交规范

本项目遵循 [Conventional Commits](https://www.conventionalcommits.org/) 规范。

### 提交类型

- `feat`: 新功能
- `fix`: 修复 bug
- `docs`: 文档更新
- `style`: 代码格式调整
- `refactor`: 重构（非新功能，非修复 bug）
- `perf`: 性能优化
- `test`: 测试相关
- `chore`: 构建/工具/配置更新

### 提交格式

```
<type>(<scope>): <subject>

<body>

<footer>
```

### 示例

```bash
# 功能开发
git commit -m "feat(installer): add auto-detection for dependencies"

# 修复 bug
git commit -m "fix(lsp): resolve clangd installation failure on Arch Linux"

# 文档更新
git commit -m "docs: update README with troubleshooting section"

# 重构
git commit -m "refactor(keymaps): simplify shortcut definitions"
```

---

## Pull Request 流程

### 1. 创建分支

```bash
git checkout -b feature/your-feature-name
# 或
git checkout -b fix/issue-123
```

### 2. 开发并提交

```bash
# 修改代码
# 运行测试
nvim --headless "+qa"  # 确保配置无错误

# 提交更改
git add .
git commit -m "feat: your feature description"
```

### 3. 推送并创建 PR

```bash
git push origin feature/your-feature-name
```

然后在 GitHub 上创建 Pull Request。

### 4. PR 描述模板

```markdown
## 变更说明
<!-- 简要描述你的更改内容 -->

## 相关问题
<!-- 链接到相关的 Issue -->
Closes #123

## 测试步骤
1. 
2. 
3. 

## 截图（如适用）
<!-- 添加截图或 GIF 演示 -->

## 检查清单
- [ ] 代码符合项目规范
- [ ] 已测试功能正常
- [ ] 更新了相关文档
- [ ] 无新的警告或错误
```

---

## 问题报告 (Bug Reports)

### 提交前检查

- [ ] 已搜索现有 Issues，确认问题未被报告
- [ ] 已尝试最新版本
- [ ] 已排除插件冲突

### Issue 模板

```markdown
### 问题描述
<!-- 清晰描述问题现象 -->

### 复现步骤
1. 
2. 
3. 

### 环境信息
- OS: 
- Neovim 版本：
- 相关插件版本：

### 错误日志
```
粘贴完整的错误日志
```

### 预期行为
<!-- 说明你认为应该发生什么 -->

### 其他信息
<!-- 截图、配置等 -->
```

---

## 代码审查 (Code Review)

所有 PR 都需要经过至少一位维护者审查。审查要点：

- ✅ 功能正确性
- ✅ 代码风格一致
- ✅ 无性能回退
- ✅ 文档已更新
- ✅ 测试已添加（如适用）

---

## 许可证

提交代码即表示你同意将代码以 [MIT 许可证](LICENSE) 授权。

---

## 致谢

感谢每一位贡献者！🎉

[![Contributors](https://contrib.rocks/image?repo=kuku-199/nvim-pioneer)](https://github.com/kuku-199/nvim-pioneer/graphs/contributors)
