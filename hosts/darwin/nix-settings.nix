{
  inputs,
  config,
  system,
  username,
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
    linux-builder = {
      enable = true;
      # ephemeral = true;
      # maxJobs = 4;
      # config = {
      #   virtualisation = {
      #     darwin-builder = {
      #       diskSize = 40 * 1024;
      #       memorySize = 8 * 1024;
      #     };
      #     cores = 6;
      #   };
      # };
    };
    channel.enable = false;
  };
  system.stateVersion = 6;

  system.primaryUser = "${username}";
  nixpkgs = {
    config.allowUnfree = true;
    hostPlatform = system;
  };
}
