-- Enable hlsearch by default
vim.opt.hlsearch = true

vim.opt.wrap = false


-- Find a way to stop highlight search, below method did not work for some reason.
vim.keymap.set("n", "<leader>h", ":noh<CR>")

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
-- vim.opt.foldlevel = 0


-- This sets the max the code is allowed to fold.
-- vim.opt.foldnestmax = 2

vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

-- Settings for tabs.
vim.keymap.set("n", "<leader><Tab>c", ":tabnew<CR>")
vim.keymap.set("n", "<leader><Tab>n", ":tabnext<CR>")
vim.keymap.set("n", "<leader><Tab>p", ":tabprev<CR>")
vim.keymap.set("n", "<leader><Tab>x", ":tabclose<CR>")

-- Toggle inlay hints with a shortcut
vim.keymap.set('n', '<leader>ih', function()
    vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
end, { desc = "Toggle Inlay Hints" })

