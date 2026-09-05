{config, inputs, ...}: {
    flake.nixosModules.stylix = {pkgs, ...}: {
        imports = [
            inputs.stylix.nixosModules.stylix
        ];

        stylix = {
            enable = true;
            base16Scheme = "${pkgs.base16-schemes}/share/themes/everforest.yaml";
            image = ./bridge_bus.jpg;
            polarity = "dark";

            fonts = {
                monospace = {
                    package = pkgs.nerd-fonts.jetbrains-mono;
                    name = "JetBrainsMono Nerd Font";
                };
                emoji = {
                    package = pkgs.noto-fonts-color-emoji;
                    name = "Noto Color Emoji";
                };
                serif = {
                    package = pkgs.google-fonts;
                    name = "Old Standard TT";
                };
                sansSerif = {
                    package = pkgs.google-fonts;
                    name = "Fira Sans";
                };
            };

            cursor = {
                package = pkgs.bibata-cursors;
                name = "Bibata Modern Classic";
                size = 24;
            };

            icons = {
                enable = true;
                package = pkgs.papirus-icon-theme;
                dark = "Papirus Dark";
                light = "Papirus Light";
            };

            targets.grub.useWallpaper = true;
        };
    };

    flake.homeModules.stylix = {pkgs, ...}: {
        stylix.enable = true;
    };
}
