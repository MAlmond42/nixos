{inputs, self, ...}: {
    flake.nixosModules.niri = {pkgs, lib, ...}: {
        programs.niri = {
            enable = true;
            package = self.packages.${pkgs.stdenv.hostPlatform.system}.niri;
        };

        environment.systemPackages = [
            pkgs.xwayland-satellite
        ];
    };

    perSystem = {pkgs, lib, self', ...}: {
        packages.niri = inputs.wrapper-modules.wrappers.niri.wrap {
            inherit pkgs;
            settings = {
                xwayland-satellite.path = lib.getExe pkgs.xwayland-satellite;

                prefer-no-csd = [];

                spawn-sh-at-startup = ["noctalia"]; #lib.getExe pkgs.noctalia

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
                        tap = [];
                        natural-scroll = [];
                        accel-profile = "adaptive";
                        scroll-method = "two-finger";
                    };

                    mouse = {
                        accel-profile = "flat";
                    };

                    focus-follows-mouse = [];
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
                            off = _: {};
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
                            off = [];
                        };
                        backdrop-color = "#232A2E";
                    };
                };

                layout = {
                    gaps = 10;
                    always-center-single-column = [];
                    center-focused-column = "on-overflow";
                    background-color = "transparent";

                    preset-column-widths = [
                        {proportion = 0.33333;}
                        {proportion = 0.5;}
                        {proportion = 0.66667;}
                        {proportion = 1.0;}
                    ];

                    preset-window-heights = [
                        {proportion = 0.33333;}
                        {proportion = 0.5;}
                        {proportion = 0.66667;}
                        {proportion = 1.0;}
                    ];

                    focus-ring = {
                        off = [];
                    };

                    border = {
                        width = 2;
                        active-color = "#A7C080";
                        inactive-color = "#2D353B";
                        urgent-color = "#E67E80";
                    };

                    shadow = {
                        on = [];
                        softness = 20;
                        spread = 2;
                        color = "#1A1A1A";
                    };
                };

                cursor = {
                    xcursor-size = 20;
                    xcursor-theme = "Bibata-Modern-Classic";
                };

                hotkey-overlay = {
                    skip-at-startup = [];
                };

                overview = {
                    workspace-shadow = {
                        off = [];
                    };
                };

                window-rules = [
                    {
                        geometry-corner-radius = 8;
                        clip-to-geometry = true;
                    }
                    {
                        matches = [
                            {app-id = "librewolf";}
                            {app-id = "steam";}
                            {app-id = "obsidian";}
                            {app-id = "thunderbird";}
                            {app-id = "gimp";}
                            {app-id = "lmstudio";}
                            {app-id = "blender";}
                            {app-id = "libresprite";}
                            {app-id = "ONLYOFFICE";}
                            {app-id = "Godot";}
                            {app-id = "davinci-resolve";}
                            {app-id = "krita";}
                            {app-id = "zen";}
                            {app-id = "dev.zed.Zed";}
                            {app-id = "trenchbroom.github.io.trenchbroom";}
                            {app-id = "firefox";}
                        ];
                        open-maximized = true;
                    }
                    {
                        matches = [
                            {app-id = "ghostty";}
                        ];
                        background-effect = {
                            blur = true;
                        };
                        opacity = 0.85;
                    }
                ];

                binds = {
                    "Mod+Return".spawn-sh = lib.getExe pkgs.ghostty;
                    "Mod+Shift+Return".show-hotkey-overlay = [];
                    "Mod+Q".close-window = [];
                    "Mod+O".toggle-overview = [];
                    "Mod+Space".spawn-sh = "noctalia msg panel-toggle launcher";
                    "Mod+W".spawn-sh = lib.getExe self'.packages.wlr-which-key;

                    XF86AudioRaiseVolume = _: {
                        props.allow-when-locked = true;
                        content.spawn-sh = "wpctl set-volume @DEFAULT_AUDIO_SINK@ 0.1+";
                    };
                    XF86AudioLowerVolume = _: {
                        props.allow-when-locked = true;
                        content.spawn-sh = "wpctl set-volume @DEFAULT_AUDIO_SINK@ 0.1-";
                    };
                    XF86AudioMute = _: {
                        props.allow-when-locked = true;
                        content.spawn-sh = "wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle";
                    };
                    XF86AudioMicMute = _: {
                        props.allow-when-locked = true;
                        content.spawn-sh = "wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle";
                    };

                    "Mod+H".focus-column-or-monitor-left = [];
                    "Mod+J".focus-window-down = [];
                    "Mod+K".focus-window-up = [];
                    "Mod+L".focus-column-or-monitor-right = [];

                    "Mod+Shift+H".move-column-left = [];
                    "Mod+Shift+J".move-window-down = [];
                    "Mod+Shift+K".move-window-up = [];
                    "Mod+Shift+L".move-column-right = [];

                    "Mod+WheelScrollUp" = _: {
                        props.cooldown-ms = 150;
                        content.focus-workspace-up = [];
                    };
                    "Mod+WheelScrollDown" = _: {
                        props.cooldown-ms = 150;
                        content.focus-workspace-down = [];
                    };

                    "Mod+1".focus-workspace = 1;
                    "Mod+2".focus-workspace = 2;
                    "Mod+3".focus-workspace = 3;
                    "Mod+4".focus-workspace = 4;
                    "Mod+5".focus-workspace = 5;
                    "Mod+6".focus-workspace = 6;
                    "Mod+7".focus-workspace = 7;
                    "Mod+8".focus-workspace = 8;
                    "Mod+9".focus-workspace = 9;
                    "Mod+Shift+1".move-window-to-workspace = 1;
                    "Mod+Shift+2".move-window-to-workspace = 2;
                    "Mod+Shift+3".move-window-to-workspace = 3;
                    "Mod+Shift+4".move-window-to-workspace = 4;
                    "Mod+Shift+5".move-window-to-workspace = 5;
                    "Mod+Shift+6".move-window-to-workspace = 6;
                    "Mod+Shift+7".move-window-to-workspace = 7;
                    "Mod+Shift+8".move-window-to-workspace = 8;
                    "Mod+Shift+9".move-window-to-workspace = 9;

                    "Mod+Comma".consume-window-into-column = [];
                    "Mod+Period".expel-window-from-column = [];

                    "Mod+R".switch-preset-column-width = [];
                    "Mod+Shift+R".switch-preset-window-height = [];

                    "Mod+F".maximize-column = [];
                    "Mod+Shift+F".fullscreen-window = [];

                    "Mod+C".center-column = [];

                    "Mod+Minus".set-column-width = "-10%";
                    "Mod+Plus".set-column-width = "+10%";
                    "Mod+Shift+Minus".set-window-height = "-10%";
                    "Mod+Shift+Plus".set-window-height = "+10%";

                    "Mod+V".toggle-window-floating = [];
                    "Mod+Shift+V".switch-focus-between-floating-and-tiling = [];

                    "Mod+T".toggle-column-tabbed-display = [];

                    "Print".screenshot = [];
                    "Ctrl+Print".screenshot-screen = [];
                    "Alt+Print".screenshot-window = [];

                    "Mod+Shift+P".power-off-monitors = [];
                };
            };
        };
    };
}
