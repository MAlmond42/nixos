{config, ...}: {
    flake.nixosModules.noctalia = {pkgs, ...}: {
        programs.noctalia = {
            enable = true;
        };
    };

    flake.homeModules.noctalia = {pkgs, ...}: {
        home.file = {
            ".local/state/noctalia/settings.toml" = {
                source = ./settings.toml;
            };
        };
    };
}
