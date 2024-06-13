return {
    'ThePrimeagen/harpoon',
    dependencies = {
        'nvim-lua/plenary.nvim'
    },
    keys = {
        {"<leader>ha", "<cmd>lua require('harpoon.mark').add_file()<cr>", desc = "Add File" },
        {"<leader>hm", "<cmd>lua require('harpoon.ui').toggle_quick_menu()<cr>", "harpoon menu" },
        {"<leader>hh", "<cmd>lua require('harpoon.ui').nav_file(1)<cr>", "file 1" },
        {"<leader>hj", "<cmd>lua require('harpoon.ui').nav_file(2)<cr>", "file 2" },
        {"<leader>hk", "<cmd>lua require('harpoon.ui').nav_file(3)<cr>", "file 3" },
    },
}
