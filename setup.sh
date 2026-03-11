#!/usr/bin/env bash

echo "Installing dev environment..."

sudo apt update
sudo apt install -y build-essential ripgrep fd-find unzip curl git nodejs npm

npm install -g tree-sitter-cli live-server prettier

mkdir -p ~/.local/bin
ln -sf $(which fdfind) ~/.local/bin/fd

echo "Setup complete!"
