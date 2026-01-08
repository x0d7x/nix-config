{
  inputs,
  outputs,
  stateVersion,
  ...
}:
{
  mkDarwin =
    {
      hostname,
      username ? "dox",
      system ? "x86_64-darwin",
    }:
    let
      inherit (inputs.nixpkgs) lib;
      customConfPath = ./../hosts/darwin/${hostname}.nix;
    in
    inputs.nix-darwin.lib.darwinSystem {
      specialArgs = {
        inherit
          system
          inputs
          username
          lib
          ;
      };
      modules = [
        # Allow unfree packages.
        { nixpkgs.config.allowUnfree = true; }
        ../hosts/darwin/pkgs.nix
        ../hosts/darwin/settings.nix
        ../hosts/darwin/services.nix
        ../hosts/darwin/dock.nix
      ];
    };
}
