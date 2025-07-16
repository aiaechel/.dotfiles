# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository Overview

This is a personal dotfiles repository managed with GNU Stow. The repository contains configuration files for:

- **Fish Shell** (`~/.config/fish/`) - Custom shell configuration with aliases, functions, and keybindings
- **Emacs** (`~/.emacs.d/`) - Based on Emacs Bedrock configuration framework
- **Alacritty** (`~/.config/alacritty/`) - Terminal emulator configuration
- **Claude Code** (`~/.claude/`) - Local permissions configuration

## Directory Structure

```
.dotfiles/
├── .config/
│   ├── alacritty/        # Terminal emulator config
│   └── fish/             # Fish shell config and functions
├── .emacs.d/             # Emacs configuration
│   ├── init.el           # Main Emacs config
│   └── extras/           # Optional Emacs modules
├── .claude/              # Claude Code settings
└── .stow-local-ignore    # Files to ignore during stow operations
```

## Deployment

This repository uses **GNU Stow** for managing dotfiles. To deploy configurations:

```bash
# Automated deployment (recommended)
./deploy.sh

# Manual deployment
stow .
```

The `deploy.sh` script:
1. Checks if GNU Stow is installed
2. Creates necessary directories (`~/.emacs.d`, `~/.config/fish`) to prevent files from being created in .dotfiles
3. Runs `stow .` to deploy configurations

The `.stow-local-ignore` file excludes `.git`, `README.md`, and `.DS_Store` from stow operations.

## Key Configuration Files

### Fish Shell (`.config/fish/config.fish`)
- Sets up `fastfetch` as greeting
- Configures `bat` as man page viewer
- Includes bash-bang functionality (`!!` and `!$`)
- Extensive aliases replacing common commands with modern alternatives:
  - `ls` → `eza` with icons and colors
  - Man page formatting with `bat`
  - System information shortcuts
- PATH includes `~/.npm-global/bin`

### Emacs (`.emacs.d/init.el`)
- Based on Emacs Bedrock minimal configuration
- Requires Emacs 29+
- Uses MELPA package repository
- Includes `which-key`, `dashboard` packages
- Modus Vivendi (dark) theme
- Only loads `extras/base.el` by default (other modules commented out)
- Configured for modern completion and minibuffer behavior

### Claude Code (`.claude/settings.local.json`)
- Permissions configured to allow specific bash commands (`find`, `grep`, `ls`)
- Local configuration for Claude Code tool access

## Common Development Tasks

Since this is a dotfiles repository, there are no build commands or tests. Configuration changes are applied by:

1. Editing the relevant configuration files
2. Running `./deploy.sh` to update symlinks (if needed)
3. Reloading the shell or restarting applications

Any files added that isn't a dotfile that should be added to my system should have its filename added to the .stow-local-ignore file

## Fish Shell Functions

Custom functions are defined in `.config/fish/functions/`:
- `emacs.fish` - Emacs-related helper
- `set-intake-fans.fish` - System-specific fan control

## Emacs Extras

The Emacs configuration includes optional modules in `extras/`:
- `base.el` - UI/UX enhancements (loaded by default)
- `dev.el` - Software development tools
- `org.el` - Org-mode configuration
- `email.el` - Email setup
- `researcher.el` - Academic research tools

To enable additional modules, uncomment the corresponding `load-file` lines in `init.el`.