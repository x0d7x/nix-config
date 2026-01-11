{
  username,
  pkgs,
  ...
}:

{
  programs.tmux = {
    enable = true;
    enableMouse = true;
    extraConfig = ''
      set-option -g default-shell ${pkgs.zsh}/bin/zsh
    ''
    + builtins.readFile ./tmux.conf;
  };
}
