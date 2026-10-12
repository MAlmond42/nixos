{pkgs, ...}: {
    vim = {
        lsp = {
            enable = true;
            inlayHints.enable = true;
            formatOnSave = true;
            presets = {
                tailwindcss-language-server.enable = true;
            };
        };
        treesitter = {
            enable = true;
            addDefaultGrammars = true;
            highlight.enable = true;
            fold = false;
            autotagHtml = true;
            indent.enable = true;
        };
        languages = {
            enableDAP = true;
            rust = {
                enable = true;
                extensions.crates-nvim.enable = true;
                lsp.enable = true;
                treesitter.enable = true;
            };
            nix = {
                enable = true;
                lsp.enable = true;
                treesitter.enable = true;
                format.enable = true;
            };
            python = {
                enable = true;
                lsp.enable = true;
                treesitter.enable = true;
            };
            typescript = {
                enable = true;
                extensions.ts-error-translator.enable = false;
                lsp.enable = true;
                treesitter.enable = true;
            };
            java = {
                enable = true;
                lsp.enable = true;
                treesitter.enable = true;
            };
            svelte = {
                enable = true;
                lsp.enable = true;
                treesitter = {
                    enable = true;
                    sveltePackage = pkgs.vimPlugins.nvim-treesitter-parsers.svelte;
                };
                format.enable = true;
            };
            html = {
                enable = true;
                lsp.enable = true;
                treesitter.enable = true;
            };
            css = {
                enable = true;
                lsp.enable = true;
                treesitter.enable = true;
            };
            json = {
                enable = true;
                format.enable = true;
                treesitter.enable = true;
                lsp.enable = true;
            };
            odin = {
                enable = true;
                lsp.enable = true;
                treesitter.enable = true;
            };
        };
    };
}
