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
        (builtins.readFile ./.zshrc)
        (builtins.readFile ./aliases)
        (builtins.readFile ./fzf)
        (builtins.readFile ./func)
      ])
    );
    promptInit = ''
      source ${pkgs.zsh-powerlevel10k}/share/zsh-powerlevel10k/powerlevel10k.zsh-theme
    '';

  };
}
