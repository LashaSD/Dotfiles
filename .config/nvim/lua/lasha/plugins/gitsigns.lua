return {
    'lewis6991/gitsigns.nvim',
    config = function()
        require('gitsigns').setup {
            signs = {
                add = { text = '+', priority = 1000 },
                delete = { text = '-', priority = 1000 },
                topdelete = { text = '-', priority = 1000 },
                changedelete = { text = '~', priority = 1000 },
                change = { text = '~', priority = 1000 },
                untracked = { text = '?', priority = 1000 }
            },
            signcolumn = true,
            numhl = false,
            linehl = false,
            current_line_blame = false,
            on_attach = function(bufnr)
                local gs = package.loaded.gitsigns

                local function map(mode, l, r, opts)
                    opts = opts or {}
                    opts.buffer = bufnr
                    vim.keymap.set(mode, l, r, opts)
                end

                -- Navigation
                map('n', ']c', function()
                    if vim.wo.diff then return ']c' end
                    vim.schedule(function() gs.next_hunk() end)
                    return '<Ignore>'
                end, {expr=true})

                map('n', '[c', function()
                    if vim.wo.diff then return '[c' end
                    vim.schedule(function() gs.prev_hunk() end)
                    return '<Ignore>'
                end, {expr=true})

                -- Actions
                map({'n', 'v'}, '<leader>hs', ':Gitsigns stage_hunk<CR>', { desc = "Stage Selected Hunk" })
                map({'n', 'v'}, '<leader>hr', ':Gitsigns reset_hunk<CR>', { desc = "Reset Selected Hunk" })
                map('n', '<leader>hS', gs.stage_buffer, { desc = "Stage Entire Buffer" })
                map('n', '<leader>hu', gs.undo_stage_hunk, { desc = "Undo Hunk Stage" })
                map('n', '<leader>hR', gs.reset_buffer, { desc = "Reset the Buffer" })
                map('n', '<leader>hp', gs.preview_hunk, { desc = "Preview Hunk" })
                map('n', '<leader>hb', function() gs.blame_line{full=true} end, { desc = "Toggle Blame Line" })
                map('n', '<leader>tB', gs.toggle_current_line_blame, { desc = "Toggle Current Line Blame Line" })
                map('n', '<leader>hd', gs.diffthis, { desc = "Diff the File" })
                map('n', '<leader>hD', function() gs.diffthis('~') end, { desc = "Diff" })

                -- Text object
                map({'o', 'x'}, 'ih', ':<C-U>Gitsigns select_hunk<CR>')
            end
        }
    end,
}

