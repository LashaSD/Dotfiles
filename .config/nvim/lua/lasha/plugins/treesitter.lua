return {
    "nvim-treesitter/nvim-treesitter",
    config = function()
        local ts = require("nvim-treesitter");

        ts.setup();
        ts.install({ "c", "lua", "vim", "vimdoc", "javascript", "html", "markdown", "c_sharp" });

        vim.api.nvim_create_autocmd("FileType", {
            callback = function(args)
                pcall(vim.treesitter.start, buf);
            end,
        });

        vim.api.nvim_create_autocmd("User", {
            pattern = "TSUpdate",
            callback = function()
                local parser_config = require("nvim-treesitter.parsers");
                parser_config.luau = {
                    install_info = {
                        url = "https://github.com/LashaSD/tree-sitter-luau",
                        branch = "main",
                        queries = "queries/neovim",
                    },
                };
            end,
        });
    end,
}
