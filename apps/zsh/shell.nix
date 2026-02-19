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
    # enableBashIntegration = true;
    enableCompletion = true;
    enableFastSyntaxHighlighting = true;
    interactiveShellInit = lib.strings.concatStrings (
      lib.strings.intersperse "\n" ([
        (builtins.readFile ./aliases)
        (builtins.readFile ./fzf)
        (builtins.readFile ./func)
        (builtins.readFile ./.zshrc)
        # (builtins.readFile ./fish/aliases.fish)
        # (builtins.readFile ./fish/fzf.fish)
        # (builtins.readFile ./fish/config.fish)
      ])
    );
    promptInit = ''
      source ${pkgs.zsh-powerlevel10k}/share/zsh-powerlevel10k/powerlevel10k.zsh-theme
      # eval "$(starship init zsh)"
    '';
  };
}
