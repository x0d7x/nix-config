{
  description = "Dox nix-darwin configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-25.05-darwin";
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nix-darwin.url = "github:nix-darwin/nix-darwin/nix-darwin-25.05";
    # nix-darwin.url = "github:x0d7x/nix-darwin/fix-karabiner-v15";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
    komorebi.url = "github:LGUG2Z/komorebi-for-mac";
  };

  outputs =
    inputs@{
      self,
      nix-darwin,
      nixpkgs,
      komorebi,
      ...
    }:
    let
      inherit (self) outputs;
      libx = import ./lib/mkDarwin.nix {
        inherit
          inputs
          nixpkgs
          outputs
          ;
      };
    in
    {
      darwinConfigurations = {
        dox = libx.mkDarwin {
          hostname = "dox";
          system = "x86_64-darwin";
          username = "dox";
        };
      };
    };
}
