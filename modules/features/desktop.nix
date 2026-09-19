{self, ...}: {
    flake.nixosModules.desktop = {pkgs, ...}: {
        imports = [
            self.nixosModules.stylix

            self.nixosModules.audio
            self.nixosModules.bluetooth
            self.nixosModules.brightness
            self.nixosModules.ssh
            self.nixosModules.file-manager
            self.nixosModules.environment
            self.nixosModules.nvim

            self.nixosModules.noctalia
            self.nixosModules.niri
        ];

        environment = {
            systemPackages = [
                self.packages.${pkgs.stdenv.hostPlatform.system}.terminal
                pkgs.pcmanfm
                pkgs.polkit_gnome
            ];

            variables.EDITOR = "nvim";
            sessionVariables = {
                NIXOS_OZONE_WL = "1";
            };
        };

        programs = {
            neovim.enable = true;
            fish.enable = true;
            localsend.enable = true;
            firefox.enable = true;
        };

        services = {
            xserver = {
                enable = true;
                xkb = {
                    layout = "de";
                    variant = "";
                };
            };
            upower.enable = true;
        };

        console.keyMap = "de";

        fonts.packages = with pkgs; [
            nerd-fonts.jetbrains-mono
            corefonts
            unifont
            dejavu_fonts
            google-fonts
        ];

        time.timeZone = "Europe/Berlin";
        i18n = {
            defaultLocale = "en_US.UTF-8";
            extraLocaleSettings = {
                LC_ADDRESS = "de_DE.UTF-8";
                LC_IDENTIFICATION = "de_DE.UTF-8";
                LC_MEASUREMENT = "de_DE.UTF-8";
                LC_MONETARY = "de_DE.UTF-8";
                LC_NAME = "de_DE.UTF-8";
                LC_NUMERIC = "de_DE.UTF-8";
                LC_PAPER = "de_DE.UTF-8";
                LC_TELEPHONE = "de_DE.UTF-8";
                LC_TIME = "de_DE.UTF-8";
            };
            inputMethod = {
                enable = true;
                type = "ibus";
            };
        };

        security.polkit.enable = true;

        hardware.enableAllFirmware = true;
    };
}
