{
  config,
  pkgs,
  username,
  inputs,
  ...
}:

let
  home = "/Users/${username}";

  aerospace = pkgs.aerospace;
  aldente = pkgs.aldente;
  hidden-bar = pkgs.hidden-bar;
  mpd = pkgs.mpd;
  shottr = pkgs.shottr;
  sketchybar = pkgs.sketchybar;
  karabiner = pkgs.karabiner-elements;
in
{
  # Services & Daemons
  services.sketchybar = {
    enable = true;
    package = sketchybar;
  };

  # All launchd agents
  launchd.user.agents = {
    aerospace = {
      serviceConfig = {
        Label = "user.aerospace";
        ProgramArguments = [ "${aerospace}/bin/aerospace" ];
        RunAtLoad = true;
        KeepAlive = true;
        StandardOutPath = "${home}/.local/state/aerospace-out.log";
        StandardErrorPath = "${home}/.local/state/aerospace-err.log";
      };
    };
    aldente = {
      serviceConfig = {
        Label = "user.aldente";
        ProgramArguments = [
          "open"
          "-a"
          "${aldente}/Applications/AlDente.app"
        ];
        RunAtLoad = true;
        KeepAlive = false;
      };
    };
    karabiner-elements = {
      serviceConfig = {
        Label = "user.karabiner-elements";
        ProgramArguments = [
          "open"
          "-a"
          "${karabiner}/Applications/karabiner-elements.app"
        ];
        RunAtLoad = true;
        KeepAlive = false;
      };
    };
    hidden-bar = {
      serviceConfig = {
        Label = "user.hidden-bar";
        ProgramArguments = [
          "open"
          "-a"
          "${hidden-bar}/Applications/Hidden Bar.app"
        ];
        RunAtLoad = true;
        KeepAlive = false;
      };
    };
    mpd = {
      serviceConfig = {
        Label = "user.mpd";
        ProgramArguments = [
          "${mpd}/bin/mpd"
          "--no-daemon"
          "${home}/.config/mpd/mpd.conf"
        ];
        RunAtLoad = true;
        KeepAlive = true;
      };
    };
    shottr = {
      serviceConfig = {
        Label = "user.shottr";
        ProgramArguments = [
          "open"
          "-a"
          "${shottr}/Applications/Shottr.app"
        ];
        RunAtLoad = true;
        KeepAlive = false;
      };
    };
  };

  system.activationScripts.applications.text =
    let
      allPkgs = config.environment.systemPackages ++ [
        aldente
        hidden-bar
        mpd
        shottr
        sketchybar
        karabiner
      ];
      env = pkgs.buildEnv {
        name = "system-applications";
        paths = allPkgs;
        pathsToLink = "/Applications";
      };
    in
    pkgs.lib.mkForce ''
      echo "Linking Nix applications to /Applications/Nix Apps..."
         rm -rf "/Applications/Nix Apps"
         mkdir -p "/Applications/Nix Apps"
         find "${env}/Applications" -maxdepth 1 -type l -exec readlink '{}' + |
         while read -r src_path; do
           app_name=$(basename "$src_path")
           echo "Aliasing $app_name"
           ${pkgs.mkalias}/bin/mkalias "$src_path" "/Applications/Nix Apps/$app_name"
         done
    '';
}
