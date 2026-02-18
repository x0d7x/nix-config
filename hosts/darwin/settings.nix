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
    ./komorebi.nix
    ./homebrew.nix
  ];
}
