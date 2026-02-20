{
  config,
  pkgs,
  username,
  ...
}:
let
  home = "/Users/${username}";
in
{
  system.defaults.dock = {
    persistent-apps = [
      "${pkgs.kitty}/Applications/Kitty.app"
      "/Applications/Zen.app"
      "${home}/Applications/AppCleaner.app"
      "/System/Applications/System Settings.app"
    ];
  };
}
