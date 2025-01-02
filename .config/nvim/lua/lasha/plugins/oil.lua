return {
    'stevearc/oil.nvim',
    opts = {},
    dependencies = { { "echasnovski/mini.icons", opts = {} } },
    config = function ()
        require('oil').setup();
        -- Bind :Ex to Oil
        vim.api.nvim_create_user_command('Ex', function() vim.cmd('Oil') end, {})

        -- Bind :Vex to Oil
        vim.api.nvim_create_user_command('Vex', function() vim.cmd('vsplit'); vim.cmd('Oil') end, { bang = true })

        -- Optional: Bind :Sexplore to Oil in a horizontal split
        vim.api.nvim_create_user_command('Sex', function() vim.cmd('split'); vim.cmd('Oil') end, { bang = true })
    end
}
