{inputs, ...}: {
    perSystem = {pkgs, ...}: {
        packages.terminal = inputs.wrapper-modules.wrappers.ghostty.wrap {
            inherit pkgs;
            settings = {
                font-family = "JetBrainsMono Nerd Font";
                font-size = 12;
                font-style = "Medium";
            };
        };
    };
}
