-- Enable hlsearch by default
vim.opt.hlsearch = true

vim.opt.wrap = false

-- Find a way to stop highlight search, below method did not work for some reason.
vim.keymap.set("n", "<esc>h", ":noh<cr>")

vim.g.mapleader = " "
-- vim.keymap.set("n", "<leader>ls", vim.cmd.Ex)
vim.keymap.set("n", "<leader>.", vim.cmd.bnext)
vim.keymap.set("n", "<leader>,", vim.cmd.bprevious)
vim.keymap.set("n", "<leader>ln", ":set number<CR>")
vim.keymap.set("n", "<leader>bc", ":%bd|e#<CR>")

vim.keymap.set("n", "<leader>w", function()
	vim.opt.wrap = true
end)
vim.keymap.set("n", "<leader>nw", function()
	vim.opt.wrap = false
end)

vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float)

vim.keymap.set("n", "<leader>%", ":vsplit<CR>")
vim.keymap.set("n", '<leader>"', ":split<CR>")

vim.keymap.set("n", "<leader>t2", ":set tabstop=2 shiftwidth=2 expandtab<CR>")
vim.keymap.set("n", "<leader>t4", ":set tabstop=4 shiftwidth=4 expandtab<CR>")

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

vim.keymap.set("n", "<leader>E", ":Ex<CR>")

-- Settings for tabs.
vim.keymap.set("n", "<leader><Tab>c", ":tabnew<CR>")
vim.keymap.set("n", "<leader><Tab>n", ":tabnext<CR>")
vim.keymap.set("n", "<leader><Tab>p", ":tabprev<CR>")
vim.keymap.set("n", "<leader><Tab>x", ":tabclose<CR>")

-- Toggle inlay hints with a shortcut
vim.keymap.set("n", "<leader>ih", function()
	vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
end, { desc = "Toggle Inlay Hints" })

vim.opt.sidescroll = 1

-- Map Option + Down Arrow to Ctrl+E (scroll down)
vim.keymap.set("n", "<M-Down>", "<C-E>", { noremap = true })
vim.keymap.set("n", "<M-j>", "<C-E>", { noremap = true })
vim.keymap.set("n", "<S-n>", "<C-E>", { noremap = true })
vim.keymap.set("n", "<S-Tab>", "<C-E>", { noremap = true })

-- Map Option + Up Arrow to Ctrl+Y (scroll up)
vim.keymap.set("n", "<M-Up>", "<C-Y>", { noremap = true })
vim.keymap.set("n", "<M-k>", "<C-Y>", { noremap = true })
vim.keymap.set("n", "<S-p>", "<C-Y>", { noremap = true })
vim.keymap.set("n", "<M-S-Tab>", "<C-Y>", { noremap = true })

-- Map Option + Right Arrow to scroll right
vim.keymap.set("n", "<M-Right>", "zl", { noremap = true, silent = true })
vim.keymap.set("n", "<M-l>", "zl", { noremap = true, silent = true })

-- Map Option + Left Arrow to scroll left
vim.keymap.set("n", "<M-Left>", "zh", { noremap = true, silent = true })
vim.keymap.set("n", "<M-h>", "zh", { noremap = true, silent = true })

-- This helps in maintaining folds even after we leave the buffer
local patterns = {
	"*.ts",
	"*.c",
	"*.rs",
	"*.js",
	"*.lua",
}
vim.api.nvim_create_autocmd("BufWinLeave", {
	pattern = patterns,
	callback = function()
		vim.cmd("mkview")
	end,
})

vim.api.nvim_create_autocmd("BufWinEnter", {
	pattern = patterns,
	callback = function()
		vim.cmd("silent! loadview")
	end,
})

-------------SCROLL MODE---------------

-- Global flag for scroll mode
vim.g.scroll_mode_active = false

-- Enter Scroll Mode
local function enter_scroll_mode()
	vim.g.scroll_mode_active = true
	print("Scroll Mode: (q to quit)")

	local opts = { buffer = 0, noremap = true, silent = true }

	-- Scroll by one line
	vim.keymap.set("n", "j", "<C-e>", opts)
	vim.keymap.set("n", "k", "<C-y>", opts)

	-- Half-page scroll
	vim.keymap.set("n", "d", "<C-d>", opts)
	vim.keymap.set("n", "u", "<C-u>", opts)

	-- Exit scroll mode
	vim.keymap.set("n", "q", function()
		exit_scroll_mode()
	end, opts)

	-- Refresh statusline
	vim.cmd("redrawstatus")
end

-- Exit Scroll Mode
function exit_scroll_mode()
	vim.g.scroll_mode_active = false
	print("Exited Scroll Mode")

	-- Remove the scroll mappings
	pcall(vim.keymap.del, "n", "j", { buffer = 0 })
	pcall(vim.keymap.del, "n", "k", { buffer = 0 })
	pcall(vim.keymap.del, "n", "d", { buffer = 0 })
	pcall(vim.keymap.del, "n", "u", { buffer = 0 })
	pcall(vim.keymap.del, "n", "q", { buffer = 0 })

	-- Refresh statusline
	vim.cmd("redrawstatus")
end

-- Keybinding to activate Scroll Mode
vim.keymap.set("n", "<leader>s", enter_scroll_mode, { noremap = true, silent = true })

-- Statusline function
-- function _G.my_statusline()
-- 	local mode = ""
-- 	if vim.g.scroll_mode_active then
-- 		mode = "[SCROLL] "
-- 	else
-- 		mode = ""
-- 	end
-- 	return mode .. "%f %m %r %=%-14.(%l,%c%V%) %P"
-- end
--
-- -- Apply custom statusline
-- vim.o.statusline = "%!v:lua.my_statusline()"
--

-- Move cursor to middle of current screen without scrolling
vim.keymap.set("n", "zm", function()
	local win_height = vim.api.nvim_win_get_height(0)
	local top_line = vim.fn.line("w0")
	local middle_line = top_line + math.floor(win_height / 2)
	vim.api.nvim_win_set_cursor(0, { middle_line, 0 })
end, { desc = "Move cursor to middle of current screen" })
