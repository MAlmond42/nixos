{inputs, ...}: {
    perSystem = {pkgs, ...}: {
        packages.wlr-which-key = inputs.wrapper-modules.wrappers.wlr-which-key.wrap {
        inherit pkgs;
            configPath = ./config.yaml;
        };
    };
}
