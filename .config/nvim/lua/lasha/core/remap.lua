vim.g.mapleader = " "
--vim.keymap.set("n", "<leader>pv", vim.cmd.Ex);
--vim.keymap.set("n", "<C-b>", vim.cmd.Neotree);

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- Pastes From Void Register and doesn't overwrite the copied value
vim.keymap.set("x", "<leader>p", [["_dP]]) 
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
