{inputs, ...}: {
    flake.nixosModules.starship = {pkgs, self', ...}: {
        programs.starship = {
            enable = true;
            package = self'.packages.starship;
        };
    };

    perSystem = {pkgs, ...}: {
        packages.starship = inputs.wrapper-modules.wrappers.starship.wrap {
            inherit pkgs;
            order = ["preset" "settings"];
            preset = ["nerd-font-symbols"];
        }; 
    };
}
