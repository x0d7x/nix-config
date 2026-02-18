{
  config,
  pkgs,
  username,
  inputs,
  ...
}:

let
  home = "/Users/${username}";
  mpd = pkgs.mpd;
in
{
  # Services & Daemons
  services.sketchybar = {
    enable = true;
  };
  # nix darwin need to deal with 15v to make the grabber lunch agent work
  # a PR of the  fix in my repo github.com:x0d7x/nix-darwin.git
  # serv
  #   enable = true;
  # };

  # Note: komorebi is managed by SKHD, not as a nix-darwin service
  programs.man.enable = true;
  # All launchd agents
  launchd.user.agents = {
    aldente = {
      serviceConfig = {
        Label = "user.aldente";
        ProgramArguments = [
          "open"
          "-a"
          "${home}/Applications/AlDente.app"
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
          "${home}/Applications/Hidden Bar.app"
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
        StandardErrorPath = "${home}/.local/share/mpd/launchd.log";
        StandardOutPath = "${home}/.local/share/mpd/launchd.log";
        EnvironmentVariables = {
          HOME = "${home}";
        };
      };
    };
    shottr = {
      serviceConfig = {
        Label = "user.shottr";
        ProgramArguments = [
          "open"
          "-a"
          "${home}/Applications/Shottr.app"
        ];
        RunAtLoad = true;
        KeepAlive = false;
      };
    };

    skhd = {
      serviceConfig = {
        ProgramArguments = [
          "${pkgs.skhd}/bin/skhd"
          "-c"
          "${home}/.config/skhd/skhdrc"
        ];
        RunAtLoad = true;
        KeepAlive = true;
      };
    };
  };

  system.activationScripts.applications.text =
    let
      allPkgs = config.environment.systemPackages ++ [
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
