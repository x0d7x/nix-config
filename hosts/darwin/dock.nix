{ config, pkgs, ... }:
{
  system.defaults.dock = {
    persistent-apps = [
      "${pkgs.kitty}/Applications/Kitty.app"
      "${pkgs.brave}/Applications/Brave Browser.app"
      "${pkgs.appcleaner}/Applications/AppCleaner.app"
      "/System/Applications/System Settings.app"
    ];
  };
}
