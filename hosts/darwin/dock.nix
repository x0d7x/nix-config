{ config, pkgs, ... }:
{
  system.defaults.dock = {
    persistent-apps = [
      "${pkgs.kitty}/Applications/kitty.app"
      "${pkgs.qutebrowser}/Applications/qutebrowser.app"
      "/Applications/Zen.app"
      "${pkgs.appcleaner}/Applications/AppCleaner.app"
      "/System/Applications/System Settings.app"
    ];
  };
}
