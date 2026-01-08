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
  nixpkgs.config.allowUnfree = true;
  environment.systemPackages = with pkgs; [

    # CLI Tools & Utilities
    asciinema-agg
    bat
    btop
    croc
    curlie
    duf
    eza
    fastfetch
    fd
    fx
    fzf
    gitleaks
    jq
    lazygit
    gnupg
    mas
    opencode
    pass
    pipx
    mkalias
    xcode-install
    ripgrep
    rsync
    stow
    tldr
    tokei
    tree
    git
    uv
    wget
    yt-dlp
    zinit
    zoxide
    tmux
    fontconfig
    mpv

    # Development & Build Tools
    bun
    flutter
    go
    jujutsu
    nixfmt-rfc-style
    rustup
    typescript-language-server
    prettierd
    gosimports
    lua-language-server
    eslint_d
    tailwindcss-language-server
    golangci-lint

    # GUI Applications
    alt-tab-macos
    aerospace
    keycastr
    kitty
    # ghostty
    neovim
    obsidian
    raycast
    wezterm
    vesktop
    appcleaner
    brave
    qutebrowser
  ];

  # Nerd Fonts
  fonts.packages = with pkgs; [
    nerd-fonts.fantasque-sans-mono
    nerd-fonts.departure-mono
    nerd-fonts.gohufont
  ];

  # environment.variables.PATH = "${pkgs.mpv}/bin:${pkgs.qutebrowser}/bin:${config.environment.systemPath}";
}
