# -------------- FZF Configuration for Fish ----------------

# Set up fzf key bindings
fzf --fish | source

# File/dir preview for fzf
set -g fzf_preview_dir_preview 'if test -d {}; eza --tree --color=always {} | head -200; else bat -n --color=always --line-range :500 {}; end'

# Use fd instead of find
set -gx FZF_DEFAULT_COMMAND "fd --hidden --strip-cwd-prefix --exclude .git"
set -gx FZF_CTRL_T_COMMAND "$FZF_DEFAULT_COMMAND"
set -gx FZF_ALT_C_COMMAND "fd --type=d --hidden --strip-cwd-prefix --exclude .git"

# Ctrl+T - file selection
set -gx FZF_CTRL_T_OPTS "
--preview 'fzf_preview_dir_preview {}'
--bind 'ctrl-/:toggle-preview'
--ansi
--height=80%"

# Ctrl+C - directory navigation
set -gx FZF_ALT_C_OPTS "
--preview 'eza --tree --color=always {} | head -200'
--ansi
--height=80%"

