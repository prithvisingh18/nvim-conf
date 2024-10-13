-- Enable hlsearch by default
vim.opt.hlsearch = true

-- Find a way to stop highlight search, below method did not work for some reason.
-- vim.keymap.set("n", "<leader>nh", ":set nohlsearch<CR>")

vim.g.mapleader = " "
-- vim.keymap.set("n", "<leader>ls", vim.cmd.Ex)
vim.keymap.set("n", "<leader>wn", vim.cmd.bnext)
vim.keymap.set("n", "<leader>wp", vim.cmd.bprevious)
vim.keymap.set("n", "<leader>ln", ":set number<CR>")
vim.keymap.set("n", "<leader>bc", ":%bd|e#<CR>")

-- Folding settings
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"


-- This sets the default fold level
vim.opt.foldlevel = 99

-- This sets the max the code is allowed to fold.
-- vim.opt.foldnestmax = 2

vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
