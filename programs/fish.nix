{inputs, ...}: {
    perSystem = {pkgs, ...}: {
        packages.fish = inputs.wrapper-modules.wrappers.fish.wrap {
            inherit pkgs;
            abbreviations = {
                ga = {
                    expansion = "git add";
                    position = "command";
                };
                gc = {
                    expansion = "git commit";
                    position = "command";
                };
                gp = {
                    expansion = "git push";
                    position = "command";
                };
                gs = "git status";
                ff = "fastfetch";
                p0 = {
                    expansion = "&> /dev/null";
                    position = "anywhere";
                };
            };

            plugins = with pkgs.fishPlugins; [
                fzf-fish
                grc
                done
                sponge
                autopair
            ];
        }; 
    };
}
