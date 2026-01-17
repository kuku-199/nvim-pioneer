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

## ✨ 核心特性

| 特性 | 说明 |
| :--- | :--- |
| 📦 **Lazy.nvim** | 最快的现代插件管理器。 |
| 🧠 **LSP 零配置** | 自动安装 Python, Lua, C++, JS/TS, Rust 等语言服务。 |
| 🎨 **智能主题** | 切换主题后会自动**记忆**，下次启动保持原样。 |
| 📊 **系统监控** | 状态栏实时显示 **CPU/RAM** 占用率。 |
| 🔍 **Telescope** | 强大的模糊搜索，找文件、搜代码只需一瞬间。 |
| 🛠️ **智能安装** | 脚本会自动检测环境，只安装缺失的工具。 |

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

1.  **备份旧配置** (如果有):
    ```bash
    mv ~/.config/nvim ~/.config/nvim.bak
    mv ~/.local/share/nvim ~/.local/share/nvim.bak
    ```

2.  **克隆仓库**:
    ```bash
    git clone https://github.com/kuku-199/nvim-pioneer.git ~/.config/nvim
    ```
    *(Windows 用户请将路径改为 `~/AppData/Local/nvim`)*

3.  **启动 Neovim**:
    ```bash
    nvim
    ```
    *首次启动会自动下载插件，请耐心等待所有进度条跑完，然后重启即可。*

---

## 🎹 常用快捷键

| 按键 | 动作 | 说明 |
| :--- | :--- | :--- |
| `<Space>` | **Leader** | 主功能键 (空格) |
| `<Space> e` | 开关文件树 | 打开侧边文件栏 |
| `<Space> ff` | 查找文件 | 模糊搜索文件名 |
| `<Space> th` | 切换主题 | 切换并**自动保存**主题 |
| `<Space> tm` | 系统监控 | 开启/关闭状态栏硬件监控 |
| `gd` | 跳转定义 | 跳转到函数/变量定义处 |
