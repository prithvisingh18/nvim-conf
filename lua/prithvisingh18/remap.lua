-- Enable hlsearch by default
vim.opt.hlsearch = true

vim.opt.wrap = false


-- Find a way to stop highlight search, below method did not work for some reason.
vim.keymap.set("n", "<esc>.", ":noh<cr>")

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
vim.opt.foldlevel = 0
vim.opt.foldlevelstart = 99


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

vim.opt.sidescroll = 1

-- Map Option + Down Arrow to Ctrl+E (scroll down)
vim.keymap.set('n', '<M-Down>', '<C-E>', { noremap = true })
vim.keymap.set('n', '<C-j>', '<C-E>', { noremap = true })

-- Map Option + Up Arrow to Ctrl+Y (scroll up)
vim.keymap.set('n', '<M-Up>', '<C-Y>', { noremap = true })
vim.keymap.set('n', '<C-k>', '<C-Y>', { noremap = true })

-- Map Option + Right Arrow to scroll right
vim.keymap.set('n', '<M-Right>', 'zl', { noremap = true, silent = true })
vim.keymap.set('n', '<C-l>', 'zl', { noremap = true, silent = true })

-- Map Option + Left Arrow to scroll left
vim.keymap.set('n', '<M-Left>', 'zh', { noremap = true, silent = true })
vim.keymap.set('n', '<C-h>', 'zh', { noremap = true, silent = true })


-- NeoVide configuration
if vim.g.neovide then
  local opts = { noremap = true }

  vim.keymap.set('v', '<S-C>', '"+y', opts)
  vim.keymap.set('n', '<S-V>', 'l"+P', opts)
  vim.keymap.set('v', '<S-V>', '"+P', opts)
  vim.keymap.set('c', '<S-V>', '<C-o>l<C-o>"+<C-o>P<C-o>l', opts)
  vim.keymap.set('i', '<S-V>', '<ESC>l"+Pli', opts)
  vim.keymap.set('t', '<S-V>', '<C-\\><C-n>"+Pi', opts)
end


