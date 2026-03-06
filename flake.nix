{
  description = "Dox nix-darwin configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-25.05-darwin";
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nixpkgs-linux.url = "github:NixOS/nixpkgs/nixos-25.05";
    nix-darwin.url = "github:nix-darwin/nix-darwin/nix-darwin-25.05";
    # nix-darwin.url = "github:x0d7x/nix-darwin/fix-karabiner-v15";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
    komorebi.url = "github:LGUG2Z/komorebi-for-mac";
    nix-homebrew.url = "github:zhaofengli/nix-homebrew";
    homebrew-core.url = "github:homebrew/homebrew-core";
    homebrew-core.flake = false;
    homebrew-cask.url = "github:homebrew/homebrew-cask";
    homebrew-cask.flake = false;
    homebrew-bundle.url = "github:homebrew/homebrew-bundle";
    homebrew-bundle.flake = false;
  };

  outputs =
    inputs@{
      self,
      nix-darwin,
      nixpkgs,
      nixpkgs-linux,
      komorebi,
      ...
    }:
    let
      inherit (self) outputs;
      libx = import ./lib/mkSystem.nix {
        inherit
          inputs
          nixpkgs
          nixpkgs-linux
          outputs
          ;
      };
    in
    {
      darwinConfigurations = {
        dox = libx "dox" {
          system = "x86_64-darwin";
          user = "dox";
          darwin = true;
        };
      };

      nixosConfigurations = {
        dox = libx "dox" {
          system = "x86_64-linux";
          user = "dox";
          darwin = false;
        };
      };
    };
}
