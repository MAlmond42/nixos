{self, ...}: {
    flake.nixosModules.environment = {pkgs, ...}: let
        selfpkgs = self.packages."${pkgs.system}";
    in {
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
            pkgs.zoxide
            pkgs.tldr
            pkgs.imagemagick
            pkgs.zip
            pkgs.unzip
            pkgs.p7zip
            pkgs.libqalculate
        ];
    };
}
