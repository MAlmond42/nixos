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

            configFile = {
                content = "
                    if status is-interactive
                        starship init fish | source
                        zoxide init fish | source
                    end

                    set -gx PATH $PATH /home/mats/.lmstudio/bin
                    ";
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
