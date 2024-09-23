-- Enable hlsearch by default
vim.opt.hlsearch = true

-- Find a way to stop highlight search, below method did not work for some reason.
-- vim.keymap.set("n", "<leader>nh", ":set nohlsearch<CR>")

vim.g.mapleader = " "
vim.keymap.set("n", "<leader>ls", vim.cmd.Ex)
vim.keymap.set("n", "<leader>wn", vim.cmd.bnext)
vim.keymap.set("n", "<leader>wp", vim.cmd.bprevious)
vim.keymap.set("n", "<leader>ln", ":set number<CR>")
vim.keymap.set("n", "<leader>bc", ":%bd|e#<CR>")




vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
