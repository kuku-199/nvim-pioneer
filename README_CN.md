# 🚀 Nvim Pioneer - Neovim 先锋配置

<div align="center">

![Neovim](https://img.shields.io/badge/Neovim-0.9+-blueviolet.svg?style=for-the-badge&logo=neovim)
![Lua](https://img.shields.io/badge/Lua-Config-blue.svg?style=for-the-badge&logo=lua)
![Platform](https://img.shields.io/badge/Platform-Win%20|%20Linux%20|%20Mac-lightgrey?style=for-the-badge)
![License](https://img.shields.io/badge/License-MIT-green.svg?style=for-the-badge)
![GitHub stars](https://img.shields.io/github/stars/kuku-199/nvim-pioneer?style=for-the-badge)

**[🇨🇳 中文文档](README_CN.md)** | **[🌏 English Docs](README.md)**

</div>

---

## 📖 简介

**Nvim Pioneer** 是一款为现代开发者打造的**模块化、高性能、易上手**的 Neovim 配置。无论你是嵌入式开发者、全栈工程师，还是编程新手，都能快速获得强大的编辑体验。

### ✨ 核心特性

| 特性 | 描述 |
| :--- | :--- |
| 📦 **模块化插件** | 按 UI、编辑器、编码、嵌入式、工具分类，结构清晰 |
| 🧠 **零配置 LSP** | 自动安装 Python、Lua、C++、JS/TS、Rust 等语言服务器 |
| 🎨 **智能主题** | 支持 Gruvbox、TokyoNight 等主题，重启自动记忆 |
| 🤖 **嵌入式开发** | 预配置 DAP、CMake、Clangd，开箱即用 |
| 🪟 **通用快捷键** | `:ToggleShortcuts` 一键切换 Ctrl+C/V/A 支持 |
| 🛠️ **智能安装器** | **NEW:** 自动检测依赖、120 秒倒计时备份、保留 Git 更新能力 |
| 📝 **Markdown 增强** | 内置浏览器预览 + 编辑器内渲染，支持数学公式、流程图 |

---

## 🎯 快速开始

### 前置要求

- **Neovim** >= 0.9
- **Git** (版本控制)
- **Node.js** (插件依赖)
- **Ripgrep** (文件搜索)
- **Python 3** (LSP 支持)

### 一键安装（推荐）

**Linux / macOS:**

```bash
git clone https://github.com/kuku-199/nvim-pioneer.git
cd nvim-pioneer
chmod +x script/setup.sh
./script/setup.sh
```

**Windows (PowerShell):**

```powershell
git clone https://github.com/kuku-199/nvim-pioneer.git
cd nvim-pioneer
powershell -ExecutionPolicy Bypass -File script/setup.ps1
```

> 💡 **智能安装器特性：**
> - 🔍 自动检测缺失依赖并提示安装
> - ⏳ 120 秒倒计时冲突解决（默认备份旧配置）
> - 🔗 保留 Git 仓库，支持 `git pull` 一键更新
> - 🛡️ 安全备份，带时间戳，随时可恢复

### 手动安装

```bash
# 1. 克隆仓库到目标位置
git clone https://github.com/kuku-199/nvim-pioneer.git ~/.config/nvim

# 2. 启动 Neovim（插件会自动安装）
nvim

# 3. 首次启动会安装插件，等待完成即可
```

---

## 🎹 常用快捷键

> **完整列表：** 在 Neovim 中按 `<Space>` 查看所有快捷键

| 快捷键 | 功能 | 描述 |
| :--- | :--- | :--- |
| `<Space>` | **主键** | 所有快捷键的起始键 |
| `<Space> e` | 文件树 | 打开/关闭文件浏览器 |
| `<Space> ff` | 查找文件 | 模糊搜索项目文件 |
| `<Space> th` | 切换主题 | 切换并保存主题 |
| `<Space> mp` | Markdown 预览 | 在浏览器预览 Markdown |
| `<Space> mr` | Markdown 渲染 | 在编辑器内渲染 Markdown |
| `:ToggleShortcuts` | 快捷键切换 | 启用/禁用 Ctrl+C/V/A |

---

## 🛠️ 更新配置

由于采用了 Git 保留技术，更新变得非常简单：

```bash
cd ~/.config/nvim
git pull origin main
```

或者在 Neovim 中（即将推出）：

```vim
:PioneerUpdate
```

> **注意：** 如果你使用的是旧版安装脚本（v2.0 之前），重新运行安装脚本即可迁移，旧配置会自动备份。

---

## 🐛 故障排除 (Troubleshooting)

### 常见问题

#### 1. 启动时报 `module 'nvim-treesitter.configs' not found`

**解决方案：**

```bash
# 方法 1: 清理插件缓存
rm -rf ~/.local/share/nvim/lazy
rm -rf ~/.local/state/nvim

# 方法 2: 重新安装插件
nvim --headless "+Lazy! sync" "+qa"
```

#### 2. Markdown 预览无法打开浏览器

**原因：** 系统缺少默认浏览器或环境变量缺失

**解决方案：**

```bash
# Linux: 设置默认浏览器
xdg-settings set default-web-browser firefox.desktop

# 或者手动打开预览 URL（会显示在命令行底部）
```

#### 3. LSP 服务器无法自动安装

**解决方案：**

```bash
# 手动安装 Mason
nvim +MasonInstall pyright +qa

# 检查 Mason 日志
cat ~/.local/state/nvim/mason.log
```

#### 4. 插件加载缓慢

**解决方案：**

```bash
# 清理插件缓存
rm -rf ~/.local/share/nvim/lazy

# 重启 Neovim
nvim
```

#### 5. 中文乱码或显示异常

**解决方案：**

1. 确保安装了 [Nerd Font](https://www.nerdfonts.com/)
2. 在终端设置中选择已安装的 Nerd Font
3. 检查系统编码是否为 UTF-8

---

## 🤝 贡献指南

欢迎贡献！请查看 [CONTRIBUTING.md](CONTRIBUTING.md) 了解如何参与开发。

### 开发环境搭建

```bash
# 1. 克隆仓库
git clone https://github.com/kuku-199/nvim-pioneer.git
cd nvim-pioneer

# 2. 安装 pre-commit 钩子（可选但推荐）
pip install pre-commit
pre-commit install

# 3. 开始开发
# 修改 lua/ 目录下的配置文件
# 运行 nvim 测试更改
```

---

## 📄 许可证

本项目采用 [MIT 许可证](LICENSE)

---

<div align="center">

**🌟 如果喜欢这个项目，请给个 Star 支持一下！**

[![Star History](https://api.star-history.com/svg?repos=kuku-199/nvim-pioneer&type=Date)](https://github.com/kuku-199/nvim-pioneer/stargazers)

</div>
