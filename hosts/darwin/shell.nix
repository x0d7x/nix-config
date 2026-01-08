{ username, pkgs, ... }:

{
  users.users.dox.shell = pkgs.zsh;
  users.users.dox.home = "/Users/${username}";
  programs.zsh = {
    enable = true;
    promptInit = ''
      # --- Zinit Initialization (Managed by Nix) ---
      # Source Zinit using the path provided by Nix
       if [[ -f ${pkgs.zinit}/share/zinit/zinit.zsh ]]; then
        source ${pkgs.zinit}/share/zinit/zinit.zsh
            else
              print -P "%F{red}Zinit not found!%f"
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
    '';
  };
}
