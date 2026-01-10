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
    '';
    promptInit = ''
       source ${pkgs.zsh-powerlevel10k}/share/zsh-powerlevel10k/powerlevel10k.zsh-theme

      [[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

    '';
  };
}
