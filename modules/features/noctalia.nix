{
    flake.nixosModules.noctalia = {pkgs, ...}: {
        programs.noctalia = {
            enable = true;
        };
    };
}
