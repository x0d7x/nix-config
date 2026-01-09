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
    ./shell.nix
    ./macos-defaults.nix
    ./aerospace.nix
  ];
}
