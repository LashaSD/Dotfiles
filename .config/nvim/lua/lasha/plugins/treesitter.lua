return {
    "nvim-treesitter/nvim-treesitter",
    build = function()
        require("nvim-treesitter.install").update({ with_sync = true })()
    end,
    config = function()
        local configs = require("nvim-treesitter.configs")

        configs.setup({
            luau = {
                parsers = {
                    install_info = {
                        url = "https://github.com/polychromatist/tree-sitter-luau",
                        files = { "src/parser.c", "src/scanner.c" },
                        branch = "main",
                    },
                    filetype = "luau",
                },
            },
            ensure_installed = { "c", "lua", "luau", "vim", "vimdoc", "javascript", "html", "markdown" },
            sync_install = false,
            highlight = { enable = true },
            indent = { enable = true },
        })
    end
}
