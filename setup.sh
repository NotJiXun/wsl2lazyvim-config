#!/usr/bin/env bash

set -e

echo "Updating system..."
sudo apt update && sudo apt upgrade -y

echo "Installing core packages..."
sudo apt install -y \
  build-essential \
  curl \
  git \
  ripgrep \
  fd-find \
  unzip \
  nodejs \
  npm

echo "Installing Neovim (latest)..."
sudo snap install nvim --classic

echo "Installing lazygit..."
LAZYGIT_VERSION=$(curl -s https://api.github.com/repos/jesseduffield/lazygit/releases/latest | grep -Po '"tag_name": "v\K[^"]*')
curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
tar xf lazygit.tar.gz lazygit
sudo install lazygit /usr/local/bin
rm lazygit lazygit.tar.gz

echo "Installing tree-sitter CLI..."
npm install -g tree-sitter-cli

echo "Fixing fd command name..."
mkdir -p ~/.local/bin
ln -sf $(which fdfind) ~/.local/bin/fd

echo "Setup complete."
