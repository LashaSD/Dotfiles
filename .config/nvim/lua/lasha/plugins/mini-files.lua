return {
    "echasnovski/mini.files",
    dependencies = { { "echasnovski/mini.icons", opts = {} } },
    config = function ()
        local mini = require("mini.files");
        mini.setup({
            mappings = {
                close       = 'q',
                go_in       = '',
                go_in_plus  = 'L',
                go_out      = '',
                go_out_plus = 'H',
                mark_goto   = "'",
                mark_set    = 'm',
                reset       = '<BS>',
                reveal_cwd  = '@',
                show_help   = 'g?',
                synchronize = '=',
                trim_left   = '<',
                trim_right  = '>',
            },
        });
        -- mini.open();
        vim.keymap.set("n", "<leader>om", mini.open, { noremap = true, silent = true, desc = "Open Mini Files" });
    end
}
