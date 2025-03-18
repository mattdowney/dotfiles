#!/bin/bash

echo "🔧 Starting full system setup..."

# Ensure Homebrew is installed
if ! command -v brew &>/dev/null; then
  echo "🍺 Installing Homebrew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
else
  echo "✅ Homebrew is already installed."
fi

# Ensure Homebrew is in the PATH
eval "$(/opt/homebrew/bin/brew shellenv)"

# Install essential CLI tools
echo "📦 Installing essential CLI tools..."
brew install git gh fzf ripgrep wget jq

# Install PHP & Composer
if ! command -v php &>/dev/null; then
  echo "🐘 Installing PHP..."
  brew install php
fi

if ! command -v composer &>/dev/null; then
  echo "🎼 Installing Composer..."
  brew install composer
fi

# Install Node.js & pnpm
if ! command -v node &>/dev/null; then
  echo "🟢 Installing Node.js..."
  brew install node
fi

if ! command -v pnpm &>/dev/null; then
  echo "📦 Installing pnpm..."
  npm install -g pnpm
fi

# Set up dotfiles directory
DOTFILES_DIR="$HOME/dotfiles"

if [ ! -d "$DOTFILES_DIR" ]; then
  echo "❌ Dotfiles directory not found!"
  exit 1
fi

echo "🎨 Linking Cursor settings..."
ln -sf "$DOTFILES_DIR/settings.json" "$HOME/Library/Application Support/Cursor/User/settings.json"

echo "🔧 Linking Git config..."
ln -sf "$DOTFILES_DIR/.gitconfig" "$HOME/.gitconfig"

echo "🐚 Linking Zsh config..."
ln -sf "$DOTFILES_DIR/.zshrc" "$HOME/.zshrc"

if [ -f "$DOTFILES_DIR/.prettierrc" ]; then
  echo "🎨 Linking Prettier config..."
  ln -sf "$DOTFILES_DIR/.prettierrc" "$HOME/.prettierrc"
fi  # ✅ This was missing before

# Install Volta (Node.js version manager)
if ! command -v volta &>/dev/null; then
  echo "⚡ Installing Volta (Node.js version manager)..."
  curl https://get.volta.sh | bash
else
  echo "✅ Volta is already installed."
fi

# Ensure Volta is in the PATH
export PATH="$HOME/.volta/bin:$PATH"

# Install latest Node.js via Volta
if ! command -v node &>/dev/null; then
  echo "🟢 Installing latest Node.js via Volta..."
  volta install node
fi

# Install PHP
if ! command -v php &>/dev/null; then
  echo "🐘 Installing PHP..."
  brew install php
else
  echo "✅ PHP is already installed."
fi

# Install Composer
if ! command -v composer &>/dev/null; then
  echo "🎼 Installing Composer..."
  brew install composer
else
  echo "✅ Composer is already installed."
fi


echo "✅ Setup complete! Restart your terminal for changes to take effect."

