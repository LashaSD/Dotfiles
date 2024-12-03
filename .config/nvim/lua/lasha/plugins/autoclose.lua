return {
    "windwp/nvim-autopairs",
    event = "InsertEnter", -- Load the plugin when entering insert mode
    config = function()
        require("nvim-autopairs").setup {}
    end,
}

