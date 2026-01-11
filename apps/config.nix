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
    ./shell.nix
    ./tmux.nix
  ];
}
