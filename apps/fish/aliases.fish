# -------------- Fish Aliases ----------------

# General
alias ls 'eza --all --icons=always --long --git --color=always --no-user --no-filesize --no-time'
alias c clear
alias e exit
alias n nvim
alias lg lazygit
alias cat bat
alias lsa 'ls -lah'
alias l 'ls -lah'
alias ll 'ls -lh'
alias la 'ls -lAh'
alias tok tokei

# Git
alias gcn "git clone --no-checkout"
alias gsi "git sparse-checkout init"
alias gss "git sparse-checkout set"

# Gemini
alias gemi gemini

# Zoxide (cd replacement)
alias g z
alias gi zi

# ImageMagick
alias convert 'magick convert'

# LazyDocker
alias lzd lazydocker

# MPV
alias mpt "mpv --vo=tct --quiet --really-quiet"

# Asciinema
alias rec 'asciinema rec'
alias asp "asciinema play"
alias aggif "agg --font-family 'JetBrainsMono Nerd Font Mono,NotoColorEmoji'"

# OpenCode
alias opc opencode

# Kitty themes
alias kitty-theme 'tmux detach-client; kitty +kitten themes'

# Bun
alias bni "bun install"
alias bnr "bun run"
alias bnd "bun run dev"
alias bnc "bun create"
alias bnrm "bun remove"

# Nix
alias nsw "sudo darwin-rebuild switch --flake .#dox"
alias nfu "nix flake update"

# Brew
alias brs "brew search"
alias bri "brew install"
alias brt "brew tap"

