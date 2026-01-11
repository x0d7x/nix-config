{
  username,
  pkgs,
  lib,
  ...
}:

{
  users.users."${username}" = {
    shell = pkgs.zsh;
    home = "/Users/${username}";
  };
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    enableFastSyntaxHighlighting = true;
    interactiveShellInit = lib.strings.concatStrings (
      lib.strings.intersperse "\n" ([
        (builtins.readFile ../../apps/zsh/.zshrc)
        (builtins.readFile ../../apps/zsh/aliases.zsh)
        (builtins.readFile ../../apps/zsh/fzf.zsh)
        "source ${pkgs.zsh-fzf-tab}/share/fzf-tab/fzf-tab.zsh"
        "source ${pkgs.zsh-autosuggestions}/share/zsh-autosuggestions/zsh-autosuggestions.zsh"
        ''
          # # --- injected by nix-darwin: zz (yazi helper) ---
            function zz() {
              local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
              ${pkgs.yazi}/bin/yazi "$@" --cwd-file="$tmp"
              if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
                builtin cd -- "$cwd"
              fi
              rm -f -- "$tmp"
            }
        ''
      ])
    );
    promptInit = ''
      source ${pkgs.zsh-powerlevel10k}/share/zsh-powerlevel10k/powerlevel10k.zsh-theme
    '';

  };
}
