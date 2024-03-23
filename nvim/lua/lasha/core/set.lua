vim.opt.relativenumber = true;

vim.opt.tabstop = 2;
vim.opt.softtabstop = 2;
vim.opt.shiftwidth = 2;
vim.opt.expandtab = true;

vim.opt.smartindent = true;

vim.opt.wrap = false;

vim.opt.undofile = true;

vim.opt.hlsearch = false;
vim.opt.incsearch = true;

vim.opt.scrolloff = 8;

vim.opt.cursorline = true

vim.filetype.add({
	extension = {
      lua = function(path)
        local a = path:match(".server.lua$");
        local b = path:match(".client.lua$");

        if (a or b) then return "luau" end

        return "lua";
		end,
	},
})

