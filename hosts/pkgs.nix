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
    asciinema
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
    gh
    git
    gitleaks
    glow
    gnupg
    jq
    lazygit
    mkalias
    mpd
    mpv
    pass
    ripgrep
    rmpc
    rsync
    stow
    tldr
    tokei
    tree
    uv
    wget
    yazi
    neovim
    yt-dlp
    zoxide

    # Development & Build Tools
    bun
    eslint_d
    flutter
    fnm
    go
    golangci-lint
    gosimports
    jujutsu
    lua-language-server
    ngrok
    nixfmt-rfc-style
    nodejs
    prettierd
    rustup
    tailwindcss-language-server
    typescript-language-server

    # GUI Applications
    # vivaldi
    discord
    kitty
    brave
  ];

  # Nerd Fonts
  fonts.packages = with pkgs; [
    nerd-fonts.fantasque-sans-mono
    nerd-fonts.departure-mono
    nerd-fonts.gohufont
  ];

  # environment.variables.PATH = "${config.environment.systemPath}";
}
