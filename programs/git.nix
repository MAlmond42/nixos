{inputs, ...}: {
    perSystem = {pkgs, ...}: {
        packages.git = inputs.wrapper-modules.wrappers.git.wrap {
            inherit pkgs;
            settings = {
                user = {
                    email = "mats@mittelflurfunk.de";
                    name = "Mats Mandelkow";
                };
            };
        }; 
    };
}
