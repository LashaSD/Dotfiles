return {
    'ThePrimeagen/harpoon',
    dependencies = {
        'nvim-lua/plenary.nvim'
    },
    keys = {
        {"<leader>ha", "<cmd>lua require('harpoon.mark').add_file()<cr>", desc = "Add File" },
        {"<leader>hm", "<cmd>lua require('harpoon.ui').toggle_quick_menu()<cr>", desc = "Open Harpoon Menu" },
        {"<leader>hh", "<cmd>lua require('harpoon.ui').nav_file(1)<cr>", desc = "Harpoon File 1" },
        {"<leader>hj", "<cmd>lua require('harpoon.ui').nav_file(2)<cr>", desc = "Harpoon File 2" },
        {"<leader>hk", "<cmd>lua require('harpoon.ui').nav_file(3)<cr>", desc = "Harpoon File 3" },
        {"<leader>hl", "<cmd>lua require('harpoon.ui').nav_file(4)<cr>", desc = "Harpoon File 3" },
        {"<leader>h1", "<cmd>lua require('harpoon.ui').nav_file(5)<cr>", desc = "Harpoon File 3" },
        {"<leader>h2", "<cmd>lua require('harpoon.ui').nav_file(6)<cr>", desc = "Harpoon File 3" },
        {"<leader>h3", "<cmd>lua require('harpoon.ui').nav_file(7)<cr>", desc = "Harpoon File 3" },
        {"<leader>h4", "<cmd>lua require('harpoon.ui').nav_file(8)<cr>", desc = "Harpoon File 3" },
    },
}
