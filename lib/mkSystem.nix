{
  nixpkgs,
  nixpkgs-linux,
  inputs,
  ...
}:

name:
{
  system,
  user,
  darwin ? false,
}:
let
  isDarwin = darwin;
  systemFunc = if isDarwin then inputs.nix-darwin.lib.darwinSystem else nixpkgs-linux.lib.nixosSystem;
  lib = if isDarwin then inputs.nixpkgs.lib else nixpkgs-linux.lib;
in
systemFunc rec {
  inherit system;

  specialArgs = {
    inherit lib;
    currentSystem = system;
    currentSystemName = name;
    currentSystemUser = user;
    username = user;
    isDarwin = isDarwin;
    inputs = inputs;
  };

  modules = [
    # Shared base (root hosts/)
    ../hosts/pkgs.nix
    ../hosts/nix-settings.nix

    # OS-specific pkgs & settings (darwin or nixos folder)
    ../hosts/${if isDarwin then "darwin" else "nixos"}/pkgs.nix
    ../hosts/${if isDarwin then "darwin" else "nixos"}/settings.nix

    # Services (darwin only)
    (if isDarwin then ../hosts/darwin/services.nix else { })

    # Apps (shared, works on both)
    ../apps/config.nix
  ];
}
