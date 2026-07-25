{
  nixosModules.stylix = {pkgs, ...}: {
    stylix = {
      enable = true;
      stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/everforest.yaml";
      image = ./bridge_bus.jpg;
      polarity = "dark";

      fonts = {
        monospace = {
          package = pkgs.nerd-fonts-jetbrains-mono;
          name = "JetBrainsMono Nerd Font";
        };
      };

      cursor = {
        package = pkgs.bibata-cursors;
        name = "Bibata Modern Classic";
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
}
