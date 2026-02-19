# -------------- Fish Shell Configuration ----------------
fish_vi_key_bindings
# Set default editor
set -gx EDITOR nvim
set -gx SHELL (which fish)
# Set XDG directories
set -gx XDG_CONFIG_HOME "$HOME/.config"
set -gx XDG_DATA_HOME "$HOME/.local/share"
set -gx XDG_CACHE_HOME "$HOME/.cache"

# Starship prompt
# starship init fish | source

# bun
set -gx BUN_INSTALL "$HOME/.bun"
set -gx PATH "$BUN_INSTALL/bin" $PATH

# Go
set -gx GOPATH "$HOME/go"
set -gx PATH "$GOPATH/bin" $PATH

# Cargo/Rust
set -gx CARGO_HOME "$HOME/.cargo"
set -gx RUSTUP_HOME "$HOME/.rustup"
set -gx PATH "$CARGO_HOME/bin" $PATH

# Node version manager
# set -gx NVM_DIR "$HOME/.nvm"

# Fastfetch
fastfetch --version 2>/dev/null; and fastfetch --load-config primary 2>/dev/null

# Kitten themes (if using kitty)
# kitty +kitten themes --cache-only

