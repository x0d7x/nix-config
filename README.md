# Dox Nix Configuration

This repository contains my personal Nix configuration for both **macOS (Darwin)** and **Linux (NixOS)**. It leverages Nix to declaratively manage system settings, installed packages, services, and OS-specific preferences.

## Features

- **Multi-Platform** — Supports both macOS (nix-darwin) and Linux (NixOS)
- **Shared Configuration** — Most packages and settings shared between platforms
- **Platform-Specific Overrides** — Darwin-only and Linux-only configurations when needed
- **Package Management** — Nix packages (some Darwin uses Homebrew via nix-homebrew)
- **Window Management** — Komorebi (macOS), Aerospace also available
- **Shell** — Zsh (Fish shell configuration also available)
- **Terminal Multiplexer** — Tmux with custom keybindings
- **Reproducible** — Easily replicate your setup on new machines

## Prerequisites

- Nix package manager installed with flakes enabled
- For macOS: macOS system
- For Linux: Ubuntu/Debian-based distro (for nixos-anywhere) or any Linux

## Installation

### macOS (Darwin)

```bash
# Clone the repository
git clone https://github.com/x0d7x/nix-config.git ~/.config/nix

# Apply the configuration
cd ~/.config/nix
nix run nix-darwin -- switch --flake .#dox
```

### Linux (NixOS) - Fresh Install

```bash
# From your Mac (where the config is):
nix run github:nix-community/nixos-anywhere -- --flake .#dox root@<vps-ip>
```

### Linux (NixOS) - Existing NixOS

```bash
# Clone and rebuild
git clone https://github.com/x0d7x/nix-config.git ~/.config/nix
cd ~/.config/nix
sudo nixos-rebuild switch --flake .#dox
```

### Ubuntu with Nix (No Wipe)

```bash
# On Ubuntu, just install Nix package manager:
sh <(curl -L https://nixos.org/nix/install) --daemon

# Then use nix-env for packages:
nix-env -i bat eza fzf
```

## Packages

### CLI Tools

asciinema, bat, btop, croc, curlie, duf, eza, fastfetch, fd, ffmpeg, fontconfig, fx, fzf, gh, git, gitleaks, glow, gnupg, jq, lazygit, mkalias, mpd, mpv, pass, ripgrep, rmpc, rsync, stow, tldr, tokei, tree, uv, wget, yazi, yt-dlp, zoxide

### Development

bun, eslint_d, flutter, fnm, go, golangci-lint, gosimports, jujutsu, lua-language-server, ngrok, nixfmt-rfc-style, nodejs, prettierd, rustup, tailwindcss-language-server, typescript-language-server

### GUI Applications (Darwin only)

karabiner-elements, discord, kitty, neovim, brave, vesktop

## Project Structure

```
.
├── flake.nix                  # Flake entry point
├── flake.lock                 # Locked dependencies
├── lib/
│   └── mkSystem.nix           # Helper to build darwin/nixos config
├── hosts/                     # Host configurations
│   ├── pkgs.nix               # Shared packages (Darwin + Linux)
│   ├── settings.nix           # Shared settings
│   ├── nix-settings.nix       # Shared Nix settings
│   ├── darwin/               # macOS-specific
│   │   ├── pkgs.nix          # Darwin-only packages
│   │   ├── settings.nix      # Darwin settings
│   │   ├── macos-defaults.nix # macOS defaults
│   │   ├── homebrew.nix      # Homebrew via nix-homebrew
│   │   ├── dock.nix          # Dock configuration
│   │   └── services.nix       # macOS services
│   └── nixos/                # Linux-specific
│       ├── pkgs.nix           # Linux-only packages (empty by default)
│       └── settings.nix       # Linux settings
└── apps/                      # User-level application configs
    ├── config.nix             # Imports shell and tmux configs
    ├── tmux/                  # Tmux configuration
    ├── zsh/                   # Zsh shell configuration
    └── fish/                  # Fish shell configuration
```

## Architecture

The flake defines:

- **darwinConfigurations.dox** — macOS config (`x86_64-darwin`)
- **nixosConfigurations.dox** — Linux config (`x86_64-linux`)

### How It Works

1. **Shared files** (`hosts/pkgs.nix`, `hosts/settings.nix`, `hosts/nix-settings.nix`) — Used by both platforms
2. **OS-specific files** (`hosts/darwin/`, `hosts/nixos/`) — Platform-specific overrides
3. **mkSystem.nix** — Single function that handles both Darwin and NixOS

### Adding New Packages

1. Most packages → add to `hosts/pkgs.nix` (shared)
2. Darwin-only → add to `hosts/darwin/pkgs.nix`
3. Linux-only → add to `hosts/nixos/pkgs.nix`

## Building

```bash
# Build Darwin (macOS)
nsw

# Build NixOS (Linux) - requires NixOS installed
sudo nixos-rebuild switch --flake .#dox
```
