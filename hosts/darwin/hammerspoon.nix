{ pkgs, ... }:

let
  version = "1.1.0";

  hammerspoon = pkgs.stdenvNoCC.mkDerivation {
    pname = "hammerspoon";
    inherit version;

    src = pkgs.fetchurl {
      url = "https://github.com/Hammerspoon/hammerspoon/releases/download/${version}/Hammerspoon-${version}.zip";
      sha256 = "0qlpd1lhx98q63m7ajqb4q5y8bx9l1mw50w2v6ip37ly1h13k0lh";
    };

    unpackPhase = ''
      unzip $src
    '';

    installPhase = ''
      mkdir -p $out/Applications
      cp -R Hammerspoon.app $out/Applications/
    '';
  };
in
{
  environment.darwinApplications = [
    "${hammerspoon}/Applications/Hammerspoon.app"
  ];
}
