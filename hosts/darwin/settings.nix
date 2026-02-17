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
    ./nix-settings.nix
    ./macos-defaults.nix
    # ./aerospace.nix
    ./komorebi.nix
    # ./hammerspoon.nix
  ];
}
