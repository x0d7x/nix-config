{ config, pkgs, ... }:
{
  system.defaults.dock = {
    persistent-apps = [
      "${pkgs.kitty}/Applications/kitty.app"
      "/Applications/Zen.app"
      "${pkgs.appcleaner}/Applications/AppCleaner.app"
      "/System/Applications/System Settings.app"
    ];
  };
}
