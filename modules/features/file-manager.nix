{self, ...}: {
    flake.nixosModules.file-manager = {pkgs, ...}: {
        imports = [
            self.nixosModules.yazi
        ];

        environment.systemPackages = with pkgs; [
            pcmanfm

            obexftp
            sshfs
            ffmpegthumbnailer
        ];

        services = {
            tumbler.enable = true;
            gvfs.enable = true;
        };
    };
}
