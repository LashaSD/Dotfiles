local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable",
        lazypath,
    })
end

vim.g.mapleader = " ";
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    spec = {
        { import = "lasha/plugins" },
        { import = "lasha/plugins/colorschemes" },
        { import = "lasha/plugins/lsp" },
    },
    defaults = {
        lazy = false,
        version = false, -- always use the latest git commit
    },
    install = { colorscheme = { "rose-pine", "tokyonight", "habamax", "catppuccin" } },
    checker = { enabled = false }, -- automatically check for plugin updates
})
