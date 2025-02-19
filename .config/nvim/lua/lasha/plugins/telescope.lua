return {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons",
        "nvim-telescope/telescope-live-grep-args.nvim"
    },
    config = function()
        local builtin = require("telescope.builtin")
        local live_grep_args_shortcuts = require("telescope-live-grep-args.shortcuts")
        vim.keymap.set("n", "<leader>gc", live_grep_args_shortcuts.grep_word_under_cursor)

        vim.keymap.set('n', "<leader>ff", builtin.find_files, { desc = "Find Files" });
        vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Find Buffers" })

        vim.keymap.set(
            "n",
            "<leader>fgg",
            "<cmd>lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>",
            { desc = "Live Grep" }
        )

        vim.keymap.set(
            "n",
            "<leader>fgi",
            live_grep_args_shortcuts.grep_word_under_cursor,
            { desc = "Live Grep The Word Under The Cursor" }
        )

        vim.keymap.set(
            "n",
            "<leader>fgv",
            live_grep_args_shortcuts.grep_visual_selection,
            { desc = "Live Grep The Visual Selection" }
        )

        local telescope = require("telescope")

        telescope.setup({
            extensions = {
                live_grep_args = {
                    theme = "dropdown"
                }
            }
        })

        telescope.load_extension("live_grep_args")
    end,
}
