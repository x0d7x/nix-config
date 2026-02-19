{
  inputs,
  config,
  pkgs,
  username,
  ...
}:
{
  imports = [
    inputs.nix-homebrew.darwinModules.nix-homebrew
  ];

  nix-homebrew = {
    enable = true;
    enableRosetta = false;
    autoMigrate = true;
    mutableTaps = true;
    user = "${username}";
    taps = with inputs; {
      "homebrew/homebrew-core" = homebrew-core;
      "homebrew/homebrew-cask" = homebrew-cask;
      "homebrew/homebrew-bundle" = homebrew-bundle;
    };
  };

  homebrew = {
    enable = true;
    taps = [
      # "lgug2z/tap"
    ];
    brews = [
    ];
    # masApps = {
    #   "Spark" = 1176895641;
    #   "VN" = 1494451650;
    # };
    onActivation = {
      cleanup = "zap";
      autoUpdate = false;
      upgrade = false;
    };
    global.autoUpdate = false;
    caskArgs = {
      appdir = "~/Applications";
      require_sha = true;
    };
    casks = [
      "aldente"
      "appcleaner"
      "hiddenbar"
      "keycastr"
      "obsidian"
      "qutebrowser"
      "zen"
      "raycast"
      "shottr"
      "stremio"
      "topnotch"
      "obs"
    ];
  };
}
