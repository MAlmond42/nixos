{self, ...}: {
    flake.nixosModules.environment = {pkgs, ...}: let
        selfpkgs = self.packages.${pkgs.stdenv.hostPlatform.system};
    in {
        programs = {
            starship = {
                enable = true;
                presets = ["nerd-font-symbols"];
            };
            zoxide.enable = true;
        };

        environment.systemPackages = [
            selfpkgs.nh
            selfpkgs.git

            pkgs.bat
            pkgs.btop
            pkgs.htop
            pkgs.curl
            pkgs.fastfetch
            pkgs.fd
            pkgs.ffmpeg
            pkgs.fzf
            pkgs.lazygit
            pkgs.ripgrep
            pkgs.tldr
            pkgs.imagemagick
            pkgs.zip
            pkgs.unzip
            pkgs.p7zip
            pkgs.libqalculate
        ];
    };
}
