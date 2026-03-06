{
  inputs,
  outputs,
  config,
  hostname,
  system,
  username,
  pkgs,
  isDarwin,
  ...
}:
let
  inherit (inputs) nixpkgs;
in
{
  imports = [
    ./macos-defaults.nix
    # ./komorebi.nix
    # ./aerospace.nix
    ./homebrew.nix
  ];

  system.primaryUser = "${username}";
}
