#!/bin/bash
# setup.sh - Nvim Pioneer Intelligent Installer
# Features:
# 1. Full environment check (Neovim, Git, Node, Ripgrep, etc.)
# 2. Auto-install missing dependencies via system package manager
# 3. Smart conflict detection with 120s countdown auto-backup
# 4. Preserves Git repository for seamless updates

set -e

# =============================================================================
# Configuration
# =============================================================================
DEST_DIR="$HOME/.config/nvim"
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(dirname "$SCRIPT_DIR")"
BACKUP_PREFIX="nvim.bak"
COUNTDOWN_SECONDS=120

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
CYAN='\033[0;36m'
NC='\033[0m' # No Color

# =============================================================================
# Helper Functions
# =============================================================================
log_info()    { echo -e "${CYAN}$1${NC}"; }
log_success() { echo -e "${GREEN}$1${NC}"; }
log_warn()    { echo -e "${YELLOW}$1${NC}"; }
log_error()   { echo -e "${RED}$1${NC}"; }

has_cmd() { command -v "$1" >/dev/null 2>&1; }

# Check Neovim version >= 0.9.0
check_nvim_ver() {
    if ! has_cmd nvim; then return 1; fi
    local ver=$(nvim --version 2>/dev/null | head -n1 | grep -oE 'v[0-9]+\.[0-9]+' | head -1 | tr -d 'v')
    if [ -z "$ver" ]; then return 1; fi
    local major=$(echo "$ver" | cut -d. -f1)
    local minor=$(echo "$ver" | cut -d. -f2)
    [ "$major" -gt 0 ] || ([ "$major" -eq 0 ] && [ "$minor" -ge 9 ])
}

# =============================================================================
# Environment Check
# =============================================================================
MISSING_DEPS=()
REQUIRED_TOOLS=("git" "nvim" "node" "rg" "python3")

check_environment() {
    log_info "🏥  System Environment Check..."
    echo ""
    
    local has_issue=false
    
    # Check Git
    if ! has_cmd git; then MISSING_DEPS+=("git"); has_issue=true; fi
    log_status "git" $has_issue

    # Check Neovim
    if ! check_nvim_ver; then MISSING_DEPS+=("neovim (>=0.9)"); has_issue=true; fi
    log_status "neovim" $has_issue

    # Check Node.js
    if ! has_cmd node; then MISSING_DEPS+=("nodejs"); has_issue=true; fi
    log_status "node" $has_issue

    # Check Ripgrep
    if ! has_cmd rg; then MISSING_DEPS+=("ripgrep"); has_issue=true; fi
    log_status "ripgrep" $has_issue

    # Check Python
    if ! has_cmd python3; then MISSING_DEPS+=("python3"); has_issue=true; fi
    log_status "python3" $has_issue

    echo ""
    if [ "$has_issue" = true ]; then
        log_warn "⚠️  Detected ${#MISSING_DEPS[@]} missing/old dependencies: ${MISSING_DEPS[*]}"
        return 1
    else
        log_success "✅ All dependencies satisfied."
        return 0
    fi
}

log_status() {
    local name=$1
    local failed=$2
    if [ "$failed" = true ]; then
        echo -e "  ❌ $name"
    else
        echo -e "  ✅ $name"
    fi
}

# =============================================================================
# Auto Install Dependencies
# =============================================================================
install_dependencies() {
    if [ ${#MISSING_DEPS[@]} -eq 0 ]; then return 0; fi

    log_info ""
    log_info "📦  Auto-install missing dependencies..."
    echo "Detected OS: $(uname -s)"
    
    local OS=""
    if [ -f /etc/os-release ]; then
        . /etc/os-release
        OS=$ID
    elif [ "$(uname)" = "Darwin" ]; then
        OS="darwin"
    else
        OS="unknown"
    fi

    case "$OS" in
        ubuntu|debian|pop)
            log_info "Installing via apt: ${MISSING_DEPS[*]}"
            sudo apt update
            sudo apt install -y git neovim nodejs npm ripgrep python3 build-essential
            ;;
        arch|manjaro|endeavouros)
            log_info "Installing via pacman: ${MISSING_DEPS[*]}"
            sudo pacman -Sy --noconfirm git neovim nodejs npm ripgrep python base-devel
            ;;
        fedora)
            log_info "Installing via dnf: ${MISSING_DEPS[*]}"
            sudo dnf install -y git neovim nodejs ripgrep python3
            ;;
        darwin)
            if has_cmd brew; then
                log_info "Installing via brew: ${MISSING_DEPS[*]}"
                brew install git neovim node ripgrep python
            else
                log_error "❌ Homebrew not found. Please install Xcode CLI and Homebrew first."
                exit 1
            fi
            ;;
        *)
            log_error "❌ Unsupported OS: $OS. Please install dependencies manually."
            exit 1
            ;;
    esac

    # Re-check
    MISSING_DEPS=()
    if ! check_environment; then
        log_error "❌ Installation failed or incomplete. Please check manually."
        exit 1
    fi
    log_success "✅ Dependencies installed successfully."
}

# =============================================================================
# Conflict Detection & Countdown
# =============================================================================
handle_conflict() {
    if [ ! -d "$DEST_DIR" ]; then
        return 0 # No conflict
    fi

    log_warn ""
    log_warn "⚠️  Conflict Detected: Existing config at $DEST_DIR"
    log_info "   New config: $REPO_ROOT (with Git update support)"
    log_info "   Old config: $DEST_DIR (will be affected)"
    echo ""

    local choice=""
    local countdown=$COUNTDOWN_SECONDS
    local start_time=$(date +%s)

    # Start countdown loop
    while [ $countdown -gt 0 ]; do
        echo -ne "\r\033[K${YELLOW}⏳  Choose action (1:Backup, 2:Overwrite, 3:Cancel) [Default: 1] in ${countdown}s: ${NC}"
        if read -t 1 -n 1 input; then
            case $input in
                1) choice="backup"; break ;;
                2) choice="overwrite"; break ;;
                3) choice="cancel"; break ;;
                *) echo -ne "\r\033[K${RED}Invalid input. Please enter 1, 2, or 3.${NC}"; sleep 1; echo -ne "\r\033[K" ;;
            esac
        else
            countdown=$((countdown - 1))
        fi
    done

    # Default to backup if timeout
    if [ -z "$choice" ]; then
        choice="backup"
        echo -e "\n${YELLOW}⏰  Timeout! Defaulting to Backup mode.${NC}"
    fi

    case $choice in
        backup)
            local timestamp=$(date +%Y%m%d_%H%M%S)
            local backup_name="${BACKUP_PREFIX}.${timestamp}"
            log_info "📦  Backing up old config to: $backup_name"
            mv "$DEST_DIR" "$HOME/$backup_name"
            log_success "✅ Backup created."
            ;;
        overwrite)
            log_warn "🗑️  Deleting old config..."
            rm -rf "$DEST_DIR"
            ;;
        cancel)
            log_info "❌  Installation cancelled by user."
            exit 0
            ;;
    esac
}

# =============================================================================
# Main Deployment
# =============================================================================
deploy() {
    log_info ""
    log_info "🚀  Deploying Nvim Pioneer..."

    # If running from target directory
    if [ "$REPO_ROOT" = "$DEST_DIR" ]; then
        log_success "✅ Already in target directory ($DEST_DIR)."
        log_info "🔧  Checking for updates..."
        cd "$DEST_DIR"
        if [ -d ".git" ]; then
            git fetch origin
            local local_rev=$(git rev-parse HEAD)
            local remote_rev=$(git rev-parse origin/main 2>/dev/null || echo "none")
            if [ "$local_rev" != "$remote_rev" ]; then
                log_info "🔄  Updates available. Pulling..."
                git pull origin main
                log_success "✅ Updated to latest version."
            else
                log_success "✅ Already up to date."
            fi
        fi
        return 0
    fi

    # Handle conflict (backup/overwrite)
    handle_conflict

    # Move the entire repo (preserving .git)
    log_info "📂  Moving configuration to $DEST_DIR..."
    mkdir -p "$(dirname "$DEST_DIR")"
    mv "$REPO_ROOT" "$DEST_DIR"
    
    # Verify Git
    cd "$DEST_DIR"
    if [ -d ".git" ]; then
        if git remote -v | grep -q "kuku-199/nvim-pioneer"; then
            log_success "✅ Git repository preserved. You can run 'git pull' to update."
        else
            log_warn "🔧  Fixing Git remote..."
            git remote add origin https://github.com/kuku-199/nvim-pioneer.git
            git remote add origin_gitee git@gitee.com:kuku-199/nvim-pioneer.git
        fi
    fi
    
    log_success "✅ Deployment successful!"
}

# =============================================================================
# Post-Install Cleanup
# =============================================================================
cleanup() {
    log_info ""
    log_info "🧹  Optional: Clean plugin cache?"
    echo "This fixes potential plugin conflicts from old installations."
    read -p "   Clear cache? [y/N] " -n 1 -r
    echo
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        rm -rf "$HOME/.local/share/nvim/lazy"
        log_success "✅ Cache cleared."
    fi
}

# =============================================================================
# Main Execution
# =============================================================================
main() {
    log_info "🚀  Nvim Pioneer Intelligent Installer"
    echo "========================================"
    
    # 1. Check Environment
    if ! check_environment; then
        echo ""
        read -p "🔧  Auto-install missing dependencies? [Y/n] " -n 1 -r
        echo
        if [[ $REPLY =~ ^[Yy]$ ]] || [ -z "$REPLY" ]; then
            install_dependencies
        else
            log_error "❌ Cannot proceed without dependencies. Exiting."
            exit 1
        fi
    fi

    # 2. Deploy
    deploy

    # 3. Cleanup
    cleanup

    # Final Message
    echo ""
    log_success "🎉  Installation Complete!"
    echo ""
    echo "📍  Config Location: $DEST_DIR"
    echo "🔄  Update Command:  cd $DEST_DIR && git pull"
    echo "🚀  Next Step:       Run 'nvim' to start."
    echo ""
    echo "💡  Tip: Your old config (if backed up) is saved with timestamp."
}

main
