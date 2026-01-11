{
  inputs,
  outputs,
  config,
  hostname,
  system,
  username,
  pkgs,
  ...
}:
let
  inherit (inputs) nixpkgs;
in
{
  imports = [
    ./zsh/shell.nix
    ./tmux/tmux.nix
  ];
}
