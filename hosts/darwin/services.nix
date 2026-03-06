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
  programs.man.enable = true;

  services.sketchybar = {
    enable = true;
  };

  launchd.user.agents = {
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
