#!/usr/bin/env bash
set -e

# Directories and paths
SRC="$HOME/.vim/init.lua"
DST_DIR="$HOME/.config/nvim"
DST="$DST_DIR/init.lua"
LOCAL_BIN="$HOME/.local/bin"
NVIM_BIN="$LOCAL_BIN/nvim"

echo "Setting up Neovim configuration symlink..."

# Check source file
if [ ! -f "$SRC" ]; then
  echo "Error: source file not found: $SRC"
  exit 1
fi

# Create target directory if necessary
mkdir -p "$DST_DIR"

# If an existing non-symlink file is found, ask before replacing it
if [ -e "$DST" ] && [ ! -L "$DST" ]; then
  echo "Warning: $DST exists and is not a symlink."
  read -p "Replace it? [y/N] " ans
  case "$ans" in
    [Yy]*) rm -rf "$DST" ;;
    *) echo "Aborted."; exit 0 ;;
  esac
fi

# Create or update symlink
ln -sf "$SRC" "$DST"
echo "Linked: $DST -> $SRC"

# --------------------------------------------------------------------
# Node.js setup
# --------------------------------------------------------------------
if ! command -v node >/dev/null 2>&1; then
  echo "Node.js not found."
  read -p "Install Node.js 22.x from NodeSource? [y/N] " ans
  if [[ "$ans" =~ ^[Yy]$ ]]; then
    if command -v apt >/dev/null 2>&1; then
      curl -fsSL https://deb.nodesource.com/setup_22.x | sudo -E bash -
      sudo apt-get install -y nodejs
    elif command -v pacman >/dev/null 2>&1; then
      sudo pacman -S nodejs npm
    elif command -v dnf >/dev/null 2>&1; then
      sudo dnf install -y nodejs npm
    else
      echo "Unsupported package manager; please install Node.js manually."
    fi
  fi
fi

# --------------------------------------------------------------------
# clangd setup
# --------------------------------------------------------------------
if ! command -v clangd >/dev/null 2>&1; then
  echo "clangd not found."
  read -p "Install clangd (for C/C++ LSP)? [y/N] " ans
  if [[ "$ans" =~ ^[Yy]$ ]]; then
    if command -v apt >/dev/null 2>&1; then
      sudo apt-get update && sudo apt-get install -y clangd
    elif command -v pacman >/dev/null 2>&1; then
      sudo pacman -S clang
    elif command -v dnf >/dev/null 2>&1; then
      sudo dnf install -y clang-tools-extra
    else
      echo "Unsupported package manager; please install clangd manually."
    fi
  fi
fi

# --------------------------------------------------------------------
# Neovim setup
# --------------------------------------------------------------------
if ! command -v nvim >/dev/null 2>&1; then
  echo "Neovim not found."
  read -p "Download and install latest Neovim (AppImage) to $NVIM_BIN? [y/N] " ans
  if [[ "$ans" =~ ^[Yy]$ ]]; then
    mkdir -p "$LOCAL_BIN"
    tmpfile=$(mktemp)
    echo "Downloading latest Neovim AppImage..."
    curl -L https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.appimage -o "$tmpfile"
    chmod +x "$tmpfile"
    mv "$tmpfile" "$NVIM_BIN"
    echo "Installed Neovim to $NVIM_BIN"
  fi
fi

# Ensure ~/.local/bin is in PATH
if [[ ":$PATH:" != *":$LOCAL_BIN:"* ]]; then
  echo "Adding $LOCAL_BIN to PATH in ~/.bashrc"
  echo "export PATH=\"$LOCAL_BIN:\$PATH\"" >> "$HOME/.bashrc"
  export PATH="$LOCAL_BIN:$PATH"
fi

# Final check
if command -v nvim >/dev/null 2>&1; then
  echo "Neovim version: $(nvim --version | head -n 1)"
else
  echo "Warning: nvim not found in PATH."
fi

