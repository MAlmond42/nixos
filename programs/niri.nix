{ self, inputs, ... }: {
  flake.nixosModules.niri = { pkgs, lib, ... }: {
    programs.niri = {
      enable = true;
      package = self.packages.${pkgs.stdenv.hostPlatform.system}.myNiri;
    };
  };

  perSystem = { pkgs, lib, self', ... }: {
    packages.myNiri = inputs.wrapper-modules.wrappers.niri.wrap {
      inherit pkgs; # THIS PART IS VERY IMPORTAINT, I FORGOT IT IN THE VIDEO!!!
      settings = {
        xwayland-satellite.path = lib.getExe pkgs.xwayland-satellite;

        prefer-no-csd = null;

        input = {
          keyboard = {
            xkb = {
              layout = "de";
              options = "altwin:swap_lalt_lwin";
            };

            repeat-delay = 300;
            repeat-rate = 30;
            track-layout = "global";
          };

          touchpad = {
            tap = null;
            natural-scroll = null;
            accel-profile = "adaptive";
            scroll-method = "two-finger";
          };

          mouse = {
            accel-profile = "flat";
          };
        };

        outputs = {
          "eDP-1" = {
            mode = "2880x1800@120.0";
            scale = 1.8;
            transform = "normal";
            position = _: {
              props = {
                x = 0;
                y = 0;
              };
            };
            hot-corners = {
              off = _: { };
            };
            backdrop-color = "#232A2E";
          };

          "HDMI-A-1" = {
            mode = "2560x1440@60.0";
            scale = 1.0;
            transform = "normal";
            position = _: {
              props = {
                x = 1600;
                y = 0;
              };
            };
            hot-corners = {
              off = null;
            };
            backdrop-color = "#232A2E";
          };
        };
        
        layout = {
          gaps = 10;
          always-center-single-column = null;
          center-focused-column = "on-overflow";
          background-color = "transparent";
          preset-column-widths = [
            {proportion = 0.33333;}
            {proportion = 0.5;}
            {proportion = 0.66666;}
            {proportion = 1.0;}
          ];
          focus-ring = {
            off = null;
          };
        };

        binds = {
          "Mod+Return".spawn-sh = lib.getExe pkgs.ghostty;
          "Mod+Q".close-window = null;
          "Mod+S".spawn-sh = "${lib.getExe self'.packages.myNoctalia} ipc call launcher toggle";
        };
      };
    };
  };
}
