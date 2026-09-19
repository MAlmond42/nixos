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
            {
                key = "<Up>";
                mode = ["n" "v" "c" "i"];
                silent = true;
                action = "<Nop>";
            }
            {
                key = "<Down>";
                mode = ["n" "v" "c" "i"];
                silent = true;
                action = "<Nop>";
            }
            {
                key = "<Left>";
                mode = ["n" "v" "c" "i"];
                silent = true;
                action = "<Nop>";
            }
            {
                key = "<Right>";
                mode = ["n" "v" "c" "i"];
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
