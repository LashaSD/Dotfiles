return {
    "LashaSD/lasha-oil.nvim",
    dependencies = { { "echasnovski/mini.icons", opts = {} } },
    config = function()
        local oil = require('oil');
        oil.setup({
            default_file_explorer = false,
            skip_confirm_for_simple_edits = true,
            delete_to_trash = true,
            watch_for_changes = false,
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
            view_options = {
                show_hidden = true
            }
        });

        -- Bind :Ex to Oil
        -- vim.api.nvim_create_user_command('Ex', function() vim.cmd('Oil') end, {})

        -- Bind :Vex to Oil
        -- vim.api.nvim_create_user_command('Vex', function() vim.cmd('vsplit'); vim.cmd('Oil') end, { bang = true })

        -- Optional: Bind :Sexplore to Oil in a horizontal split
        -- vim.api.nvim_create_user_command('Sex', function() vim.cmd('split'); vim.cmd('Oil') end, { bang = true })

        vim.api.nvim_create_user_command("Ex", function(opts)
            local path = opts.args ~= "" and vim.fn.expand(opts.args) or vim.fn.getcwd();
            local MAX_ENTRIES = 250;
            local count = 0;

            -- Count directory entries up to max_entries+1
            for _ in vim.fs.dir(path) do
                count = count + 1;
                if count > MAX_ENTRIES then break end
            end

            if count > MAX_ENTRIES then
                vim.cmd.edit(path);
            else
                oil.open(path);
            end
        end, {
                nargs = "?",
                desc = "Smart Ex",
            });

        vim.keymap.set("n", "<leader>of", ":Oil --float<CR>", { noremap = true, silent = true, desc = "Open Oil in float mode" })
    end
}
