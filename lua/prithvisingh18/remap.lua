vim.g.mapleader = " "
vim.keymap.set("n", "<leader>ls", vim.cmd.Ex)
vim.keymap.set("n", "<leader>wn", vim.cmd.bnext)
vim.keymap.set("n", "<leader>wp", vim.cmd.bprevious)
vim.keymap.set("n", "<leader>ln", ":set number<CR>")
vim.keymap.set("n", "<leader>bca", ":%bd|e#<CR>")




vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
