# 🚀 Nvim Pioneer - Neovim 个人配置

<div align="center">

![Neovim](https://img.shields.io/badge/Neovim-0.9+-blueviolet.svg?style=for-the-badge&logo=neovim)
![Lua](https://img.shields.io/badge/Lua-Config-blue.svg?style=for-the-badge&logo=lua)
![Platform](https://img.shields.io/badge/Platform-Win%20|%20Linux%20|%20Mac-lightgrey?style=for-the-badge)
![License](https://img.shields.io/badge/License-MIT-green.svg?style=for-the-badge)

**[🇨🇳 中文文档](README_CN.md)** | **[🌏 English Docs](README.md)**

</div>

---

## 📖 这是什么？

**Nvim Pioneer** 是我的个人 Neovim 配置文件，主打高性能和易上手。包含零配置 LSP、智能主题切换和智能安装脚本。

**欢迎随意取用、Fork 或只抄部分代码！**

### ✨ 核心特性

| 特性 | 描述 |
| :--- | :--- |
| 📦 **模块化插件** | 按 UI、编辑器、编码、嵌入式、工具分类 |
| 🧠 **零配置 LSP** | 自动安装 Python、Lua、C++、JS/TS、Rust 等语言服务器 |
| 🎨 **智能主题** | 支持 Gruvbox、TokyoNight 等主题，重启自动记忆 |
| 🤖 **嵌入式开发** | 预配置 DAP、CMake、Clangd，开箱即用 |
| ⌨️ **通用快捷键** | `:ToggleShortcuts` 一键切换 Ctrl+C/V/A 支持 |
| 🛠️ **智能安装器** | 自动检测依赖、120 秒倒计时备份、保留 Git 更新能力 |
| 📝 **Markdown 增强** | 内置浏览器预览 + 编辑器内渲染，支持数学公式、流程图 |

---

## 🎯 快速开始

### 前置要求

- **Neovim** >= 0.9
- **Git**, **Node.js**, **Ripgrep**, **Python 3**

### 一键安装

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

> 💡 **安装器特性：** 自动检测依赖、120 秒倒计时备份、保留 Git 以便后续更新。

---

## 🎹 常用快捷键

> **完整指南：** [docs/guide/keybindings_CN.md](docs/guide/keybindings_CN.md) - 包含 Neovim 基础 + 所有快捷键！

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

安装器会保留 Git 仓库，更新非常简单：

```bash
cd ~/.config/nvim
git pull origin main
```

---

## 🐛 故障排除

### 常见问题

#### 1. 报错：`module 'nvim-treesitter.configs' not found`

**解决方法：**

```bash
# 清理插件缓存
rm -rf ~/.local/share/nvim/lazy
rm -rf ~/.local/state/nvim

# 重启 Neovim
nvim
```

#### 2. Markdown 预览无法打开浏览器

**原因：** 缺少默认浏览器或环境变量缺失

**解决方法：** 手动打开命令行显示的 URL，或设置默认浏览器：
```bash
xdg-settings set default-web-browser firefox.desktop
```

#### 3. LSP 服务器无法自动安装

**解决方法：**
```bash
# 手动安装
nvim +MasonInstall pyright +qa
```

---

## 📚 文档索引

更多详细指南请查看 [docs/](docs/README.md) 目录：

- **[快捷键与基础](docs/guide/keybindings_CN.md)** - 完整快捷键参考 + Neovim 基础
- **[安装指南](docs/README.md)** - 各平台详细安装步骤
- **[故障排除](docs/README.md)** - 常见问题与解决方案

---

## 📄 许可证

MIT 许可证 - 想怎么用就怎么用。

---

<div align="center">

**🌟 如果这个配置对你有帮助，欢迎随意使用！**

Made with ❤️ by [kuku-199](https://github.com/kuku-199)

</div>
