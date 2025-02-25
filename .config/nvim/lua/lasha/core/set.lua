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

-- Trailing Whitespace
vim.cmd [[ set list ]]
vim.cmd [[ set listchars+=trail:◦ ]]

vim.cmd "colorscheme minimal"
vim.cmd[[ hi! link Folded @character.special ]]
