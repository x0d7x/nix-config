{
  inputs,
  config,
  pkgs,
  system,
  isDarwin,
  lib,
  ...
}:

{
  nix = {
    settings = {
      experimental-features = [
        "nix-command"
        "flakes"
      ];
      warn-dirty = false;
    };
  }
  // lib.optionalAttrs isDarwin {
    linux-builder = {
      enable = true;
    };
    channel.enable = false;
  };

  system.stateVersion = 6;

  nixpkgs = {
    config.allowUnfree = true;
  };
}
