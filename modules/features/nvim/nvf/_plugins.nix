{pkgs, ...}: {
    vim = {
        mini = {
            statusline.enable = true;
            tabline.enable = true;
            cursorword.enable = true;
            icons.enable = true;
            git.enable = true;
            diff = {
                enable = false;
                setupOpts = {
                    view.style = "sign";
                };
            };
        };

        git = {
            gitsigns.enable = true;
        };

        telescope = {
            enable = true;
            extensions = [
                {
                    name = "fzf";
                    packages = [pkgs.vimPlugins.telescope-fzf-native-nvim];
                    setup = {fzf = {fuzzy = true;};};
                }
            ];
        };

        statusline.lualine = {
            enable = false;
            setupOpts.theme = "everforest";
        };

        utility = {
            outline.aerial-nvim = {
                enable = true;
            };

            motion.flash-nvim = {
                enable = true;
            };
        };

        autocomplete.blink-cmp = {
            enable = true;
            friendly-snippets.enable = true;
            mappings.complete = "<C-Tab>";
        };

        autopairs.nvim-autopairs = {
            enable = true;
        };

        visuals = {
            cellular-automaton = {
                enable = true;
            };

            indent-blankline = {
                enable = true;
            };
        };

        binds.whichKey = {
            enable = true;
            setupOpts.preset = "helix";
        };

        tabline.nvimBufferline = {
            enable = false;
        };

        lsp.trouble = {
            enable = true;
        };
    };
}
