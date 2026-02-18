{
  config,
  inputs,
  pkgs,
  ...
}:

{
  imports = [
    inputs.komorebi.darwinModules.komorebi
  ];
  nixpkgs.overlays = [
    inputs.komorebi.overlays.default
  ];
  services.komorebi = {
    enable = true;
    logLevel = "info";

    config = {
      # Core configuration
      border = true;
      border_width = 3;
      border_radius = 13;
      border_offset = 1;

      # Layout settings - SCROLLING
      # default_layout = "Scrolling";
      # stack_enabled = true;
      # transparency = true;
      mouse_follows_focus = true;

      # Padding and spacing
      default_container_padding = 16;
      default_workspace_padding = 25;

      # Cross-monitor behavior
      cross_boundary_behaviour = "Monitor";
      cross_monitor_move_behaviour = "Swap";

      # Window behavior
      window_container_behaviour = "Create";
      float_override = false;
      floating_layer_behaviour = "Tile";

      theme = {
        palette = "Base16";
        name = "GruvboxMaterialLightHard";
        # bar_accent = "Blue";
        # floating_border = "Red";
        # monocle_border = "Yellow";
        # single_border = "Blue";
        # stack_border = "Green";
        # unfocused_border = "Red";
        # unfocused_locked_border = "Red";
      };
      monitors = [
        {
          workspaces = [
            {
              name = "T";
              layout = "Scrolling";
              tile = true;
              apply_window_based_work_area_offset = true;
              layout_options = {
                scrolling = {
                  columns = 2;
                  # center_focused_column = true;
                };
              };
            }
            {
              name = "S";
              tile = true;
              apply_window_based_work_area_offset = true;
              layout_rules = {
                "1" = "BSP";
                "4" = "Scrolling";
              };
              layout_options = {
                scrolling = {
                  columns = 2;
                  center_focused_column = true;
                };
              };
            }
            {
              name = "B";
              tile = true;
              apply_window_based_work_area_offset = true;
              layout_rules = {
                "1" = "BSP";
                "4" = "Scrolling";
              };
              layout_options = {
                scrolling = {
                  columns = 2;
                  center_focused_column = true;
                };
              };
            }
            {
              name = "D";
              tile = true;
              apply_window_based_work_area_offset = true;
              layout_rules = {
                "1" = "BSP";
                "4" = "Scrolling";
              };
              layout_options = {
                scrolling = {
                  columns = 2;
                  center_focused_column = true;
                };
              };
            }
          ];
        }
      ];

      # Application-specific configuration
      # Floating applications
      floating_applications = [
        {
          id = "com.apple.finder";
          kind = "Class";
        }
        {
          id = "com.apple.Passwords";
          kind = "Class";
        }
        {
          id = "net.freemacsoft.AppCleaner";
          kind = "Class";
        }

        {
          id = "Picture in Picture";
          kind = "Title";
          matching_strategy = "Contains";
        }
        {
          id = "io.mpv";
          kind = "Class";
        }
        {
          id = "Cap";
          kind = "Exe";
          matching_strategy = "Equals";
        }
      ];

      # Application workspace assignments for named workspaces
      # manage_rules = [
      #   # Terminal workspace (T)
      #   {
      #     id = "org.alacritty";
      #     kind = "Class";
      #     workspace = "T";
      #   }
      #   {
      #     id = "net.kovidgoyal.kitty";
      #     kind = "Class";
      #     workspace = "T";
      #   }
      #   {
      #     id = "com.mitchellh.ghostty";
      #     kind = "Class";
      #     workspace = "T";
      #   }
      #   {
      #     id = "com.github.wez.wezterm";
      #     kind = "Class";
      #     workspace = "T";
      #   }
      #
      #   # Browser workspace (B)
      #   {
      #     id = "app.zen-browser.zen";
      #     kind = "Class";
      #     workspace = "B";
      #   }
      #   {
      #     id = "com.brave.Browser";
      #     kind = "Class";
      #     workspace = "B";
      #   }
      #   {
      #     id = "org.nixos.qutebrowser";
      #     kind = "Class";
      #     workspace = "B";
      #   }
      #
      #   # Development workspace (D)
      #   {
      #     id = "md.obsidian";
      #     kind = "Class";
      #     workspace = "D";
      #   }
      #
      #   # Media workspace (M)
      #   {
      #     id = "com.smartcodeltd.stremio";
      #     kind = "Class";
      #     workspace = "M";
      #   }
      #   {
      #     id = "dev.vencord.vesktop";
      #     kind = "Class";
      #     workspace = "M";
      #   }
      #   {
      #     id = "io.mpv";
      #     kind = "Class";
      #     workspace = "M";
      #   }
      #
      #   # Screenshots workspace (S)
      #   {
      #     id = "cc.ffitch.shottr";
      #     kind = "Class";
      #     workspace = "S";
      #   }
      #   {
      #     id = "com.obsproject.obs-studio";
      #     kind = "Class";
      #     workspace = "S";
      #   }
      #
      # ];
      #
      # Enable komorebi-bar for status bar integration
      # komorebi-bar = {
      #   enable = true;
      #   bars = {
      #     main = {
      #       config = {
      #         monitor = 0;
      #         # Basic bar configuration
      #         position = "top";
      #         height = 30;
      #         background = {
      #           opacity = 0.8;
      #           blur_radius = 10;
      #         };
      #       };
      #     };
      #   };
    };
  };
}
