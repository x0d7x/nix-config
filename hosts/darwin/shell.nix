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
      eval "$(zoxide init zsh)" 
      eval "$(fzf --zsh)"
        # --- injected by nix-darwin: zz (yazi helper) ---
        function zz() {
          local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
          ${pkgs.yazi}/bin/yazi "$@" --cwd-file="$tmp"
          if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
            builtin cd -- "$cwd"
          fi
          rm -f -- "$tmp"
        }
        # Auto-start tmux if available and not already in a session
          if command -v tmux >/dev/null 2>&1 && [ -z "$TMUX" ] && ! tmux has-session 2>/dev/null; then
             exec tmux new-session -s Dev
          fi
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
