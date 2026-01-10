{
  config,
  pkgs,
  ...
}:

{
  services.aerospace = {
    enable = true;
    package = pkgs.aerospace;
    settings = {
      # Core options with structured nix-darwin settings
      enable-normalization-flatten-containers = true;
      enable-normalization-opposite-orientation-for-nested-containers = true;
      accordion-padding = 30;
      default-root-container-layout = "tiles";
      default-root-container-orientation = "horizontal";
      key-mapping.preset = "qwerty";

      # Freeform TOML-style configuration
      after-startup-command = [
        "exec-and-forget /run/current-system/sw/bin/sketchybar"
      ];

      on-focused-monitor-changed = [ "move-mouse monitor-lazy-center" ];

      on-focus-changed = [
        "move-mouse window-lazy-center"
        "exec-and-forget ~/.local/bin/sticky"
      ];

      exec-on-workspace-change = [
        "/bin/bash"
        "-c"
        "/run/current-system/sw/bin/sketchybar --trigger
     aerospace_workspace_change
     FOCUSED_WORKSPACE=$AEROSPACE_FOCUSED_WORKSPACE
     PREV_WORKSPACE=$AEROSPACE_PREV_WORKSPACE"
      ];

      gaps = {
        inner.horizontal = 12;
        inner.vertical = 12;
        outer.left = 14;
        outer.bottom = 15;
        outer.top = 35;
        outer.right = 14;
      };

      mode.main.binding = {
        alt-slash = "layout tiles horizontal vertical";
        alt-comma = "layout accordion horizontal vertical";
        alt-h = "focus left";
        alt-j = "focus down";
        alt-k = "focus up";
        alt-l = "focus right";
        alt-shift-h = "move left";
        alt-shift-j = "move down";
        alt-shift-k = "move up";
        alt-shift-l = "move right";
        alt-shift-minus = "resize smart -50";
        alt-shift-equal = "resize smart +50";
        alt-d = "workspace D";
        alt-q = "workspace Q";
        alt-s = "workspace S";
        alt-m = "workspace M";
        alt-g = "workspace G";
        alt-t = "workspace T";
        alt-b = "workspace B";
        alt-r = "macos-native-fullscreen";
        alt-f = "fullscreen";
        alt-n = "workspace N";
        alt-shift-b = "move-node-to-workspace B";
        alt-shift-d = "move-node-to-workspace D";
        alt-shift-q = "move-node-to-workspace Q";
        alt-shift-m = "move-node-to-workspace M";
        alt-shift-s = "move-node-to-workspace S";
        alt-shift-t = "move-node-to-workspace T";
        alt-shift-n = "move-node-to-workspace N";
        alt-shift-g = "move-node-to-workspace G";
        alt-shift-w = "exec-and-forget ~/.local/bin/chbg";
        alt-tab = "workspace-back-and-forth";
        alt-shift-tab = "move-workspace-to-monitor --wrap-around next";
        alt-shift-semicolon = "mode service";
        alt-shift-space = "layout floating tiling";
      };

      mode.service.binding = {
        r = [
          "reload-config"
          "mode main"
        ];
        esc = [ "mode main" ];
        m = [
          "flatten-workspace-tree"
          "mode main"
        ];
        backspace = [
          "close-all-windows-but-current"
          "mode main"
        ];
        alt-shift-h = [
          "join-with left"
          "mode main"
        ];
        alt-shift-j = [
          "join-with down"
          "mode main"
        ];
        alt-shift-k = [
          "join-with up"
          "mode main"
        ];
        alt-shift-l = [
          "join-with right"
          "mode main"
        ];
      };

      on-window-detected = [
        {
          "if".app-id = "net.kovidgoyal.kitty";
          run = "move-node-to-workspace T";
        }
        {
          "if".app-id = "com.mitchellh.ghostty";
          run = "move-node-to-workspace T";
        }
        {
          "if".app-id = "com.github.wez.wezterm";
          run = "move-node-to-workspace T";
        }
        {
          "if".app-id = "com.brave.Browser";
          "if".window-title-regex-substring = "Picture in Picture";
          check-further-callbacks = true;
          run = "layout floating";
        }
        {
          "if".app-id = "app.zen-browser.zen";
          "if".window-title-regex-substring = "Picture-in-Picture";
          check-further-callbacks = true;
          run = "layout floating";
        }
        {
          "if".app-id = "org.mozilla.floorp";
          "if".window-title-regex-substring = "Picture-in-Picture";
          check-further-callbacks = true;
          run = "layout floating";
        }
        {
          "if".app-id = "app.zen-browser.zen";
          run = "move-node-to-workspace B";
        }
        {
          "if".app-id = "org.mozilla.floorp";
          run = "move-node-to-workspace B";
        }
        {
          "if".app-id = "com.operasoftware.OperaAir";
          run = "move-node-to-workspace B";
        }
        {
          "if".app-id = "com.brave.Browser";
          run = "move-node-to-workspace B";
        }
        {
          "if".app-id = "com.brave.Browser.nightly";
          run = "move-node-to-workspace B";
        }
        {
          "if".app-id = "org.nixos.qutebrowser";
          check-further-callbacks = true;
          run = "layout tiling";
        }
        {
          "if".app-id = "org.nixos.qutebrowser";
          run = "move-node-to-workspace B";
        }
        {
          "if".app-id = "io.mpv";
          run = "layout floating";
        }
        {
          "if".app-id = "com.smartcodeltd.stremio";
          run = "move-node-to-workspace M";
        }
        {
          "if".app-id = "dev.vencord.vesktop";
          run = "move-node-to-workspace D";
        }
        {
          "if".app-id = "md.obsidian";
          run = "move-node-to-workspace N";
        }
        {
          "if".app-id = "cc.ffitch.shottr";
          run = "move-node-to-workspace S";
        }
        {
          "if".app-id = "so.cap.desktop";
          run = "move-node-to-workspace S";
        }
        {
          "if".app-id = "maccatalyst.com.frontrow.vlog";
          run = "move-node-to-workspace S";
        }
        {
          "if".app-id = "com.wulkano.kap";
          run = "move-node-to-workspace S";
        }
        {
          "if".app-id = "net.freemacsoft.AppCleaner";
          run = "layout floating";
        }
        {
          "if".app-id = "app.legcord.Legcord";
          run = "move-node-to-workspace D";
        }
        {
          "if".app-id = "com.apple.finder";
          run = "layout floating";
        }
        {
          "if".app-id = "com.apple.Passwords";
          run = "layout floating";
        }
        {
          "if".app-id = "com.obsproject.obs-studio";
          run = "move-node-to-workspace S";
        }
      ];
    };
  };
}
