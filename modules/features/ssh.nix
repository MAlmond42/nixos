{
    flake.nixosModules.ssh = {pkgs, ...}: {
        services.openssh = {
            enable = true;
            openFirewall = true;
            settings = {
                PasswordAuthentication = true;
            };
        };
    };
}
