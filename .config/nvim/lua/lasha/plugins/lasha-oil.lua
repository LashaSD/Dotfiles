return {
    "LashaSD/lasha-oil.nvim",
    dependencies = { { "echasnovski/mini.icons", opts = {} } },
    config = function()
        local oil = require('oil');
        oil.setup({
            watch_for_changes = true,
            columns = {
                "git_status",
                "icon",
                "size",
            },
            keymaps = {
                ["<C-s>"] = "actions.select",
                ["<C-v>"] = {"actions.select", opts = { vertical = true }},
                ["<C-r>"] = "actions.refresh"
            },
            git_column = {
                modified = {"~", "@character.special"},
                staged = {"+", "@diff.plus"},
                untracked = {"?", "@comment.warning"},
                none = {"-", "@comment"}
            },
        });

        -- Bind :Ex to Oil
        vim.api.nvim_create_user_command('Ex', function() vim.cmd('Oil') end, {})

        -- Bind :Vex to Oil
        vim.api.nvim_create_user_command('Vex', function() vim.cmd('vsplit'); vim.cmd('Oil') end, { bang = true })

        -- Optional: Bind :Sexplore to Oil in a horizontal split
        vim.api.nvim_create_user_command('Sex', function() vim.cmd('split'); vim.cmd('Oil') end, { bang = true })

        vim.keymap.set("n", "<leader>of", ":Oil --float<CR>", { noremap = true, silent = true, desc = "Open Oil in float mode" })
    end
}
