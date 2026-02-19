# Dox Nix-Darwin Configuration

This repository contains my personal Nix-Darwin configuration for macOS. It leverages Nix and nix-darwin to declaratively manage system settings, installed packages, services, and macOS preferences. This ensures a reproducible and consistent development environment across machines.

## Features

- **Declarative macOS Configuration** — Manage your entire macOS system through Nix
- **Package Management** — Hybrid approach using both Nix packages and Homebrew via nix-homebrew
- **Window Management** — Komorebi tiling window manager (Aerospace also available)
- **Shell** — Zsh (Fish shell configuration also available)
- **Terminal Multiplexer** — Tmux with custom keybindings and session management
- **System Customization** — macOS defaults, dock, and services
- **Reproducible** — Easily replicate your setup on new machines

## Prerequisites

- Nix package manager installed
- macOS system

## Installation

```bash
# Clone the repository
git clone https://github.com/x0d7x/nix-config.git ~/.config/nix

# Apply the configuration
cd ~/.config/nix
nix run nix-darwin -- switch --flake .#dox
```

## Packages

### CLI Tools
asciinema, bat, btop, croc, curlie, duf, eza, fastfetch, fd, ffmpeg, fzf, git, gitleaks, gnupg, jq, lazygit, mas, mkalias, mpd, mpv, pass, ripgrep, rmpc, rsync, skhd, starship, stow, tldr, tokei, tree, uv, wget, yazi, yt-dlp, zoxide

### Development
bun, eslint_d, flutter, fnm, go, golangci-lint, gosimports, jujutsu, lua-language-server, ngrok, nixfmt-rfc-style, nodejs, prettierd, rustup, tailwindcss-language-server, typescript-language-server

### GUI Applications
karabiner-elements, kitty, neovim, brave, vesktop

## Project Structure

```
.
├── flake.nix              # Flake entry point
├── flake.lock             # Locked dependencies
├── lib/
│   └── mkDarwin.nix       # Helper to build darwin config
├── hosts/darwin/          # macOS-specific configuration
│   ├── settings.nix       # Main settings (imports other modules)
│   ├── nix-settings.nix  # Nix-specific settings
│   ├── macos-defaults.nix # macOS system defaults
│   ├── homebrew.nix      # Homebrew packages via nix-homebrew
│   ├── komorebi.nix      # Komorebi window manager config
│   ├── pkgs.nix          # Nix packages to install
│   └── services.nix      # macOS services
└── apps/                  # User-level application configs
    ├── config.nix         # Imports shell and tmux configs
    ├── tmux/              # Tmux configuration
    └── zsh/               # Zsh shell configuration
        └── shell.nix      # Zsh config (Fish configs also available in fish/)
```

## Architecture

The flake defines a single Darwin host (`dox`) running on x86_64-darwin. Configuration is split into:
- **hosts/darwin/** — System-level settings (packages, services, window manager, macOS defaults, Homebrew)
- **apps/** — User-level configs (shell, tmux)

Both Zsh and Fish shell configurations are provided. Zsh is currently active.
