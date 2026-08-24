{self, inputs, ...}: {
    flake.nixosModules.mats = {pkgs, ...}: {
        users.users.mats = {
            isNormalUser = true;
            shell = pkgs.fish;
            extraGroups = ["wheel" "networkmanager"];
            initialPassword = "12345";
        };

        home-manager.users.mats = self.homeModules.mats;
    };

    flake.homeModules.mats = {pkgs, ...}: {
        import = [];

        home = {
            username = "mats";
            homeDirectory = "/home/mats";
        };

        nixpkgs.config.allowUnfree = true;
    };
}
