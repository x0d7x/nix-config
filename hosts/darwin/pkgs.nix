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
    mas
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
    xcode-install
    yazi
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
    karabiner-elements
    discord
    kitty
    neovim
    brave
    vesktop
  ];

  # Nerd Fonts
  fonts.packages = with pkgs; [
    nerd-fonts.fantasque-sans-mono
    nerd-fonts.departure-mono
    nerd-fonts.gohufont
  ];

  # environment.variables.PATH = "${config.environment.systemPath}";
}
