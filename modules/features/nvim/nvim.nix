{inputs, ...}: {
    flake.nixosModules.nvim = {
        imports = [ inputs.nvf.nixosModules.default ];

        programs.nvf = {
            enable = true;
            settings = ./nvf/_default.nix;
        };
    };
}
