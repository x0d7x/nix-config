{
  username,
  pkgs,
  ...
}:

{
  programs.tmux = {
    enable = true;
    enableMouse = true;
    extraConfig =
      ''''
      + builtins.readFile ./tmux/tmux.conf
      + ''
        set-option -g default-shell ${pkgs.zsh}/bin/zsh
      '';

  };
}
