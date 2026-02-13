{ config, pkgs, ... }:
{
  system.defaults.dock = {
    persistent-apps = [
      "${pkgs.alacritty}/Applications/Alacritty.app"
      "${pkgs.brave}/Applications/Brave Browser.app"
      "${pkgs.appcleaner}/Applications/AppCleaner.app"
      "/System/Applications/System Settings.app"
    ];
  };
}
