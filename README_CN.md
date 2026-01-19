# 🚀 Nvim Pioneer (拓荒者)

<div align="center">

![Neovim](https://img.shields.io/badge/Neovim-0.9%2B-blueviolet.svg?style=for-the-badge&logo=neovim)
![Lua](https://img.shields.io/badge/Lua-Config-blue.svg?style=for-the-badge&logo=lua)
![Platform](https://img.shields.io/badge/平台-Win%20|%20Linux%20|%20Mac-lightgrey?style=for-the-badge)
![License](https://img.shields.io/badge/协议-MIT-green.svg?style=for-the-badge)

**[🇺🇸 English Docs](README.md)**

</div>

---

**Nvim Pioneer** 专为初学者打造的模块化 Neovim 配置。注重性能与教学，代码注释详细，无需折腾即可获得顶级的开发体验。

## ⚠️ 常见报错解决 (安全模式)

如果遇到 `module 'nvim-treesitter.configs' not found` 崩溃循环：
1. **不要慌。** 本配置已启用 **安全模式**（默认关闭自动下载），防止坏死。
2. 请重新运行 **安装脚本**，并在询问 "Clear Cache" (清理缓存) 时选 **Yes**。
3. 或者手动删除缓存：`rm -rf ~/.local/share/nvim` (Linux/Mac) 或 删除 `%LOCALAPPDATA%\nvim-data` (Windows)。
4. 进入 Neovim 后，手动安装需要的语言：`:TSInstall c`, `:TSInstall lua`。

## ✨ 核心特性

| 特性 | 说明 |
| :--- | :--- |
| 📦 **模块化插件** | 插件按 UI、编辑器、代码、嵌入式、工具 分类管理。 |
| 🧠 **LSP 零配置** | 自动安装 Python, Lua, C++, JS/TS, Rust 等语言服务。 |
| 🎨 **智能主题** | 切换主题后会自动**记忆**，下次启动保持原样。 |
| 🤖 **嵌入式开发** | **新增:** 预装调试 (DAP), CMake 工具链。 |
| 🪟 **通用快捷键** | **新增:** 输入 `:ToggleShortcuts` 一键开启 Ctrl+C/V/Z/A。 |
| 🛠️ **安全安装** | 脚本会检测旧配置，并在**覆盖前询问你**。 |

---

## 🛠️ 前置需求

在运行 Neovim 之前，你需要安装一些基础工具。我们提供了脚本一键安装。

*   **Neovim** (v0.9 以上)
*   **Git** & **Nerd Font**
*   **Node.js**, **Python**, **Ripgrep**, **GCC**

### 一键安装脚本

**Linux / macOS:**
```bash
chmod +x scripts/setup.sh
./scripts/setup.sh
```

**Windows (PowerShell):**
```powershell
powershell -ExecutionPolicy Bypass -File scripts/setup.ps1
```

---

## 🚀 安装步骤

1.  **克隆仓库**:
    ```bash
    git clone https://github.com/kuku-199/nvim-pioneer.git
    cd nvim-pioneer
    ```

2.  **运行安装**:
    运行上方的脚本。脚本非常安全，如果发现你电脑里已经有 nvim 配置，它会先问你，经你同意后才会备份并覆盖。

3.  **启动 Neovim**:
    ```bash
    nvim
    ```

---

## 🎹 常用快捷键

> **完整列表：** 请查看 [keybindings_CN.md](keybindings_CN.md) 获取所有快捷键的详细说明。

| 按键 | 动作 | 说明 |
| :--- | :--- | :--- |
| `<Space>` | **Leader** | 主功能键 (空格) |
| `<Space> e` | 开关文件树 | 打开侧边文件栏 |
| `<Space> ff` | 查找文件 | 模糊搜索文件名 |
| `<Space> th` | 切换主题 | 切换并**自动保存**主题 |
| `:ToggleShortcuts` | 通用模式 | 开关 Ctrl+C/V/A 等快捷键 |
