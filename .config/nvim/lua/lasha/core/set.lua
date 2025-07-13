vim.opt.relativenumber = true;
vim.opt.number = true;

vim.opt.tabstop = 4;
vim.opt.softtabstop = 4;
vim.opt.shiftwidth = 4;
vim.opt.expandtab = true;

vim.opt.smartindent = true;

vim.opt.wrap = true;

vim.opt.undofile = true;

vim.opt.hlsearch = false;
vim.opt.incsearch = true;

vim.opt.scrolloff = 8;

vim.opt.cursorline = true

-- Fold
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
vim.opt.foldlevelstart = 1001
vim.api.nvim_set_keymap('i', '<ESC>', '<ESC>zv', {noremap = true, silent = true})

-- Error Formats
vim.api.nvim_create_autocmd("FileType", {
    pattern = { "lua", "luau" },
    callback = function()
        vim.opt.errorformat = "%f\\(%l\\,%c\\): %t%*[^:]: %m", ',';
    end,
})

-- Trailing Whitespace
vim.cmd [[ set list ]]
vim.cmd [[ set listchars+=trail:◦ ]]

vim.cmd "colorscheme evergarden"
vim.cmd[[ hi! link Folded @character.special ]]

-- status line
require("lasha.core.status-line").setup();

-- import .nvim.lua file if present
local init_file_name = ".nvim.lua";
local init_file_exists = false do
    local f = io.open(init_file_name, "r");
    init_file_exists = f ~= nil;
end

if init_file_exists then
    vim.cmd([[ source ./]] .. init_file_name);
end
