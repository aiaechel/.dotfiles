#!/bin/bash

# Deploy dotfiles script
# This script deploys dotfiles using GNU Stow

set -e

echo "Deploying dotfiles..."

# Check if GNU Stow is installed
if ! command -v stow &> /dev/null; then
    echo "Error: GNU Stow is not installed. Please install it first."
    echo ""
    echo "Install GNU Stow and recommended applications:"
    echo "On Arch Linux: sudo pacman -S stow emacs fish eza bat fastfetch alacritty dex"
    echo "On Ubuntu/Debian: sudo apt install stow emacs fish bat alacritty dex && cargo install eza fastfetch"
    exit 1
fi

echo "✓ GNU Stow is installed"

# Create necessary directories to prevent files from being created in .dotfiles
mkdir -p ~/.emacs.d
echo "✓ Created ~/.emacs.d directory"

mkdir -p ~/.config/fish
echo "✓ Created ~/.config/fish directory"

mkdir -p ~/.config/rofi
echo "✓ Created ~/.config/rofi directory"

mkdir -p ~/.config/sway
echo "✓ Created ~/.config/sway directory"

# Deploy dotfiles using stow
stow .
echo "✓ Dotfiles deployed successfully!"

echo "Deployment complete. You may need to restart your shell or applications to see changes."

echo ""
echo "Recommended applications to install for full functionality:"
echo "• Emacs (text editor) - Required for .emacs.d configuration"
echo "• Fish shell - Required for shell configuration"
echo "• eza (modern ls replacement) - Used in fish aliases"
echo "• bat (modern cat replacement) - Used for man pages and aliases"
echo "• fastfetch - Used as fish greeting"
echo "• Alacritty - Terminal emulator (config included)"
echo "• dex - Required for autostarting applications in Sway"
echo ""
echo "On Arch Linux: sudo pacman -S emacs fish eza bat fastfetch alacritty dex"
echo "On Ubuntu/Debian: sudo apt install emacs fish bat alacritty dex && cargo install eza fastfetch"