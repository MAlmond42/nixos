{
    vim.assistant = {
        copilot = {
            enable = false;
            cmp.enable = true;
            mappings = {
                suggestion = {
                    accept = "<Leader>aa";
                    dismiss = "<Leader>ad";
                };
            };
        };

        supermaven-nvim = {
            enable = false;
            setupOpts = {
                ignore_file = {
                    markdown = true;
                };
                keymaps.accept_suggestion = "<C-Space>";
                disable_inline_completion = true;
            };
        };
    };
}
