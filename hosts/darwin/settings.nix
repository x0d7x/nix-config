{
  inputs,
  outputs,
  config,
  hostname,
  system,
  username,
  pkgs,
  ...
}:
let
  inherit (inputs) nixpkgs;
in
{
  nix = {
    settings = {
      experimental-features = [
        "nix-command"
        "flakes"
      ];
      warn-dirty = false;
    };
    linux-builder = {
      enable = true;
      # ephemeral = true;
      # maxJobs = 4;
      # config = {
      #   virtualisation = {
      #     darwin-builder = {
      #       diskSize = 40 * 1024;
      #       memorySize = 8 * 1024;
      #     };
      #     cores = 6;
      #   };
      # };
    };
    # This line is a prerequisite
    settings.trusted-users = [ "@admin" ];
    channel.enable = false;
  };
  system.stateVersion = 6;

  system.primaryUser = "dox";
  nixpkgs = {
    config.allowUnfree = true;
    hostPlatform = system;
  };
  users.users.dox.shell = pkgs.zsh;
  users.users.dox.home = "/Users/${username}";
  programs.zsh = {
    enable = true;
    promptInit = ''
      # --- Zinit Initialization (Managed by Nix) ---
      # Source Zinit using the path provided by Nix
       if [[ -f ${pkgs.zinit}/share/zinit/zinit.zsh ]]; then
        source ${pkgs.zinit}/share/zinit/zinit.zsh
            else
              print -P "%F{red}Zinit not found!%f"
            fi
      # --- injected by nix-darwin: zz (yazi helper) ---
      function zz() {
        local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
        ${pkgs.yazi}/bin/yazi "$@" --cwd-file="$tmp"
        if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
          builtin cd -- "$cwd"
        fi
        rm -f -- "$tmp"
      }
    '';
  };
  system.defaults.CustomUserPreferences = {
    "com.apple.finder" = {

      CreateDesktop = false;
      AppleShowAllExtensions = true;
      FXRemoveOldTrashItems = true;
      QuitMenuItem = true;
      NewWindowTarget = "Desktop";
      ShowStatusBar = true;
      _FXSortFoldersFirst = true;
      ShowPathbar = true;
      WarnOnEmptyTrash = false;
      DisableAllAnimations = true;
    };
    "com.apple.desktopservices" = {
      # Avoid creating .DS_Store files on network or USB volumes
      DSDontWriteNetworkStores = true;
      DSDontWriteUSBStores = true;
    };
    "com.apple.dock" = {
      enable-window-tool = false;
      show-process-indicators = true;
      mineffect = "scale";
      autohide = true;
      orientation = "bottom";
      autohide-delay = 0.25;
      autohide-time-modifier = 0.1;
      largesize = 70;
      minimize-to-application = true;
      magnification = true;
      show-recents = false;
    };
    "com.apple.HIToolbox" = {
      # Completely disable Caps Lock functionality
      AppleFnUsageType = 1; # Enable Fn key functionality
      AppleKeyboardUIMode = 3;
      # Disable Caps Lock toggle entirely
      AppleSymbolicHotKeys = {
        "60" = {
          enabled = false; # Disable Caps Lock toggle hotkey
        };
      };
      # Override modifier key behavior to prevent Caps Lock from functioning
      AppleModifierKeyRemapping = {
        "1452-630-0" = {
          # Map Caps Lock (Source: 30064771129) to Control (Destination: 30064771131)
          HIDKeyboardModifierMappingSrc = 30064771129; # Caps Lock
          HIDKeyboardModifierMappingDst = 30064771131; # Control
        };
      };
    };
    "com.apple.TimeMachine".DoNotOfferNewDisksForBackup = true;
    "com.apple.SoftwareUpdate" = {
      AutomaticCheckEnabled = true;
      # Check for software updates daily, not just once per week
      ScheduleFrequency = 1;
      # Download newly available updates in background
      AutomaticDownload = 1;
      # Install System data files & security updates
      CriticalUpdateInstall = 1;
    };
  };
  system.defaults = {
    loginwindow = {
      GuestEnabled = false;
    };
    NSGlobalDomain = {
      AppleShowAllExtensions = true;
      AppleShowScrollBars = "Always";
      NSUseAnimatedFocusRing = false;
      NSDocumentSaveNewDocumentsToCloud = false;
      InitialKeyRepeat = 25;
      ApplePressAndHoldEnabled = false;
      KeyRepeat = 2;
      NSAutomaticSpellingCorrectionEnabled = false;
    };
    menuExtraClock = {
      Show24Hour = true;
      ShowAMPM = true;
      ShowDate = 0;
      ShowDayOfMonth = true;
      ShowDayOfWeek = true;
    };
    screensaver.askForPasswordDelay = 300;
  };
}
