{
  description = "Dox nix-darwin configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-25.05-darwin";
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nix-darwin.url = "github:nix-darwin/nix-darwin/nix-darwin-25.05";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs =
    inputs@{
      self,
      nix-darwin,
      nixpkgs,
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
