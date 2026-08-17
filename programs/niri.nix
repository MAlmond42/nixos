{
self,
inputs,
...
}: {
    flake.nixosModules.niri = {
        pkgs,
        lib,
        ...
        }: {
            programs.niri = {
                enable = true;
                package = self.packages.${pkgs.stdenv.hostPlatform.system}.myNiri;
            };
        };

    perSystem = {
        pkgs,
        lib,
        self',
        ...
        }: {
            packages.myNiri = inputs.wrapper-modules.wrappers.niri.wrap {
                inherit pkgs;
                settings = {
                    xwayland-satellite.path = lib.getExe pkgs.xwayland-satellite;

                    prefer-no-csd = null;

                    spawn-at-startup = [(lib.getExe self'.packages.myNoctalia)];

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
                            off = null;
                        };

                        border = {
                            width = 2;
                            active-color = "#A7C080";
                            inactive-color = "#2D353B";
                            urgent-color = "#E67E80";
                        };

                        shadow = {
                            on = null;
                            softness = 20;
                            spread = 2;
                            color = "#1A1A1A";
                        };
                    };

                    cursor = {
                        xcursor-size = 20;
                    };

                    hotkey-overlay = {
                        skip-at-startup = null;
                    };

                    overview = {
                        workspace-shadow = {
                            off = null;
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
                            ];
                            open-maximized = true;
                        }
                    ];

                    binds = {
                        "Mod+Return".spawn-sh = lib.getExe pkgs.ghostty;
                        "Mod+Shift+Return".show-hotkey-overlay = null;
                        "Mod+Q".close-window = null;
                        "Mod+O".toggle-overview = null;
                        "Mod+Space".spawn-sh = "rofi -show drun";
                        "Mod+W".spawn-sh = "wlr-which-key";

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

                        "Mod+H".focus-column-or-monitor-left = null;
                        "Mod+J".focus-window-down = null;
                        "Mod+K".focus-window-up = null;
                        "Mod+L".focus-column-or-monitor-right = null;

                        "Mod+Shift+H".move-column-left = null;
                        "Mod+Shift+J".move-window-down = null;
                        "Mod+Shift+K".move-window-up = null;
                        "Mod+Shift+L".move-column-right = null;

                        "Mod+WheelScrollUp" = _: {
                            props.cooldown-ms = 150;
                            content.focus-workspace-up = null;
                        };
                        "Mod+WheelScrollDown" = _: {
                            props.cooldown-ms = 150;
                            content.focus-workspace-down = null;
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

                        "Mod+Comma".consume-window-into-column = null;
                        "Mod+Period".expel-window-from-column = null;

                        "Mod+R".switch-preset-column-width = null;
                        "Mod+Shift+R".switch-preset-window-height = null;

                        "Mod+F".maximize-column = null;
                        "Mod+Shift+F".fullscreen-window = null;

                        "Mod+C".center-column = null;

                        "Mod+Minus".set-column-width = "-10%";
                        "Mod+Plus".set-column-width = "+10%";
                        "Mod+Shift+Minus".set-window-height = "-10%";
                        "Mod+Shift+Plus".set-window-height = "+10%";

                        "Mod+V".toggle-window-floating = null;
                        "Mod+Shift+V".switch-focuse-between-floating-and-tiling = null;

                        "Mod+T".toggle-column-tabbed-display = null;

                        "Print".screenshot = null;
                        "Ctrl+Print".screenshot-screen = null;
                        "Alt+Print".screenshot-window = null;

                        "Mod+Shift+P".power-off-monitors = null;
                    };
                };
            };
        };
}
