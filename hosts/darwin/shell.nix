{ username, pkgs, ... }:

{
  users.users."${username}" = {
    shell = pkgs.zsh;
    home = "/Users/${username}";
  };
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    enableFastSyntaxHighlighting = true;
    interactiveShellInit = ''
       if [[ -r "''${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-''${(%):-%n}.zsh" ]]; then
       source "''${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-''${(%):-%n}.zsh"
       fi
       [ -f "''${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh" ] && source "''${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh"
       plug "TunaCuma/zsh-vi-man"
       setopt autocd
       setopt correct
       setopt interactivecomments
       setopt magicequalsubst
       setopt nonomatch
       setopt notify
       setopt numericglobsort
       setopt promptsubst
       setopt appendhistory
       setopt sharehistory
       setopt hist_ignore_space
       setopt hist_ignore_all_dups
       setopt hist_save_no_dups
       setopt hist_ignore_dups
       setopt hist_find_no_dups
      # Environment Variables
       export GPG_TTY=$TTY
       export EDITOR=nvim
       export VISUAL=nvim
      # export ZVM_MAN_PAGER='bat'
       export SUDO_EDITOR=nvim
       export FCEDIT=nvim
      # Set unique PATH entries with correct order
       path+=(
       $HOME/.local/bin
       $HOME/.bun/bin
       )
       typeset -gU path
       export PATH
      # ZSH Keybindings
       bindkey -v
       bindkey '^p' history-search-backward
       bindkey '^n' history-search-forward
      # History Configuration
       HISTSIZE=10000
       HISTFILE=$HOME/.zsh_history
       SAVEHIST=$HISTSIZE
       HISTDUP=erase
       eval "$(zoxide init zsh)" 
       eval "$(fzf --zsh)"
      # Set zstyle
         zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
         zstyle ':completion:*' menu no
         zstyle ':fzf-tab:complete:cd:*' fzf-preview 'eza -1 --color=always $realpath'
         zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'eza --tree --color=always $realpath'
         zstyle ':fzf-tab:*' use-fzf-default-opts yes
        # Auto-start tmux if available and not already in a session
         if command -v tmux >/dev/null 2>&1 && [ -z "$TMUX" ] && ! tmux has-session 2>/dev/null; then
            exec tmux new-session -s Dev
         fi
           # --- injected by nix-darwin: zz (yazi helper) ---
           function zz() {
             local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
             ${pkgs.yazi}/bin/yazi "$@" --cwd-file="$tmp"
             if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
               builtin cd -- "$cwd"
             fi
             rm -f -- "$tmp"
           }
             source "$HOME/.config/zsh/fzf.zsh"
             source "$HOME/.config/zsh/aliases.zsh"
             source ${pkgs.zsh-fzf-tab}/share/fzf-tab/fzf-tab.zsh
             source ${pkgs.zsh-autosuggestions}/share/zsh-autosuggestions/zsh-autosuggestions.zsh
    '';
    promptInit = ''
      source ${pkgs.zsh-powerlevel10k}/share/zsh-powerlevel10k/powerlevel10k.zsh-theme

       [[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
    '';
  };
}
