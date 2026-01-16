{
  inputs,
  config,
  pkgs,
  ...
}:
let
  inherit (inputs) nixpkgs;
in
{

  environment.systemPackages = with pkgs; [

    # CLI Tools & Utilities
    # man
    asciinema-agg
    bat
    btop
    croc
    curlie
    duf
    eza
    fastfetch
    fd
    ffmpeg
    fontconfig
    fx
    fzf
    git
    gitleaks
    gnupg
    jq
    lazygit
    mas
    mkalias
    mpd
    mpv
    pass
    pipx
    ripgrep
    rmpc
    rsync
    stow
    tldr
    tokei
    tree
    uv
    wget
    xcode-install
    yazi
    yt-dlp
    zoxide
    starship
    # Development & Build Tools
    bun
    eslint_d
    fnm
    flutter
    go
    golangci-lint
    gosimports
    jujutsu
    lua-language-server
    nixfmt-rfc-style
    nodejs
    prettierd
    rustup
    tailwindcss-language-server
    typescript-language-server

    # GUI Applications
    # vivaldi
    alt-tab-macos
    appcleaner
    brave
    keycastr
    kitty
    neovim
    obsidian
    qutebrowser
    raycast
    vesktop
    karabiner-elements
    wezterm
  ];

  # Nerd Fonts
  fonts.packages = with pkgs; [
    nerd-fonts.fantasque-sans-mono
    nerd-fonts.departure-mono
    nerd-fonts.gohufont
  ];

  # environment.variables.PATH = "${config.environment.systemPath}";
}
