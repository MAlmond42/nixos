{lib, ...}: {
    vim = {
        diagnostics = {
            enable = true;
            config = {
                virtual_text = {
                    prefix = "● ";
                    spacing = 4;
                };
                update_in_insert = true;
                signs.text = lib.generators.mkLuaInline ''
          {
            [vim.diagnostic.severity.ERROR] = "󰅚 ",
            [vim.diagnostic.severity.WARN] = "󰀪 ",
            [vim.diagnostic.severity.HINT] = " ",
          }
                '';
            };
        };
    };
}
