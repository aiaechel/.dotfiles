# .dotfiles
Repo to hold my dotfiles

## Deployment

To deploy these dotfiles, run the `deploy.sh` script:

```bash
./deploy.sh
```

This script uses [GNU Stow](httpss://www.gnu.org/software/stow/) to create symlinks for the dotfiles in your home directory. It will also check for some recommended dependencies and create necessary directories.

## Configurations

This repository contains configurations for:

- **Sway:** A tiling Wayland compositor.
- **Rofi:** A window switcher, application launcher, and dmenu replacement.
- **Fish Shell:** A smart and user-friendly command line shell.
- **Alacritty:** A fast, cross-platform, OpenGL terminal emulator.
- **Emacs:** A powerful and extensible text editor.
