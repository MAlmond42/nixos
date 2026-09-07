{
    vim = {
        keymaps = [
            {
                key = " ";
                mode = ["n" "v"];
                silent = true;
                action = "<Nop>";
            }
            {
                key = "<S-Tab>";
                mode = ["i"];
                silent = true;
                action = "<Nop>";
            }
        ];
        options = {
            tabstop = 4;
            shiftwidth = 4;
            autoindent = true;
        };
    };
}
