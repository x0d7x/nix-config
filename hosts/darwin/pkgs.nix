{
  config,
  pkgs,
  ...
}:
{
  environment.systemPackages = with pkgs; [
    # Darwin-only packages
    karabiner-elements
    mas
    xcode-install
  ];
}
