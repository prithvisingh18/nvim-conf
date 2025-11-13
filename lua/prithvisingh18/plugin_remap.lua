vim.keymap.set("n", "<leader>zm", ":ZenMode<CR>")

-- Neotree setup
-- disable netrw at the very start of your init.lua
--vim.g.loaded_netrw = 1
--vim.g.loaded_netrwPlugin = 1

-- vim.keymap.set("n", "<leader>b", vim.cmd.Neotree)
vim.keymap.set("n", "<leader>bl", ":Neotree reveal buffers left<CR>")
vim.keymap.set("n", "<leader>blc", ":Neotree reveal buffers float<CR>")
vim.keymap.set("n", "<leader>bll", ":Neotree reveal buffers right<CR>")

vim.keymap.set("n", "<leader>bf", ":Neotree reveal filesystem left<CR>")
vim.keymap.set("n", "<leader>bfc", ":Neotree reveal filesystem float<CR>")
vim.keymap.set("n", "<leader>bfl", ":Neotree reveal filesystem right<CR>")

vim.keymap.set("n", "<leader>bg", ":Neotree reveal git_status<CR>")
vim.keymap.set("n", "<leader>ba", ":Neotree reveal last<CR>")

require("neo-tree").setup({
	filesystem = {
		follow_current_file = { enabled = true }, -- Automatically focus on the current file in Neo-tree
		hijack_netrw_behavior = "open_default", -- Replace netrw with Neo-tree
		use_libuv_file_watcher = true, -- Watch for changes in the filesystem
	},
	window = {
		position = "left",
		width = 0.3,
		mappings = {
			["P"] = { "toggle_preview", config = { use_float = true } },
			["J"] = function(state)
				local tree = state.tree
				local node = tree:get_node()
				local siblings = tree:get_nodes(node:get_parent_id())
				local renderer = require("neo-tree.ui.renderer")
				renderer.focus_node(state, siblings[#siblings]:get_id())
			end,
			["K"] = function(state)
				local tree = state.tree
				local node = tree:get_node()
				local siblings = tree:get_nodes(node:get_parent_id())
				local renderer = require("neo-tree.ui.renderer")
				renderer.focus_node(state, siblings[1]:get_id())
			end,
		},
	},
})

-- Telescope setup
local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>tf", ":Telescope find_files theme=dropdown<CR>")
vim.keymap.set("n", "<leader>tg", ":Telescope live_grep theme=dropdown<CR>")
vim.keymap.set("n", "<leader>tb", ":Telescope buffers theme=dropdown<CR>")
vim.keymap.set("n", "<leader>te", ":Telescope file_browser<CR>")
vim.keymap.set("n", "<leader>tj", ":Telescope jumplist theme=dropdown<CR>")
vim.keymap.set("n", "<leader>ts", ":Telescope git_status theme=ivy<CR>")
vim.keymap.set("n", "<leader>th", builtin.help_tags, {})

-- Configure zero lsp, copied from
-- https://lsp-zero.netlify.app/v4.x/tutorial.html#setup-lsp-zero
-- local lsp_zero = require("lsp-zero")
--
-- -- lsp_attach is where you enable features that only work
-- -- if there is a language server active in the file
-- local lsp_attach = function(client, bufnr)
-- 	local opts = { buffer = bufnr }
-- 	vim.keymap.set("n", "K", "<cmd>lua vim.lsp.buf.hover()<cr>", opts)
-- 	vim.keymap.set("n", "gd", "<cmd>lua vim.lsp.buf.definition()<cr>", opts)
-- 	vim.keymap.set("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<cr>", opts)
-- 	vim.keymap.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<cr>", opts)
-- 	vim.keymap.set("n", "go", "<cmd>lua vim.lsp.buf.type_definition()<cr>", opts)
-- 	vim.keymap.set("n", "gr", "<cmd>lua vim.lsp.buf.references()<cr>", opts)
-- 	vim.keymap.set("n", "gs", "<cmd>lua vim.lsp.buf.signature_help()<cr>", opts)
-- 	vim.keymap.set("n", "<F2>", "<cmd>lua vim.lsp.buf.rename()<cr>", opts)
-- 	vim.keymap.set({ "n", "x" }, "ff", "<cmd>lua vim.lsp.buf.format({async = true})<cr>", opts)
-- 	vim.keymap.set("n", "<F4>", "<cmd>lua vim.lsp.buf.code_action()<cr>", opts)
-- end
--
-- lsp_zero.extend_lspconfig({
-- 	sign_text = true,
-- 	lsp_attach = lsp_attach,
-- 	capabilities = require("cmp_nvim_lsp").default_capabilities(),
-- })
--
-- -- lsp_zero.on_attach(function(client, bufnr)
-- --   lsp_zero.default_keymaps({buffer = bufnr})
-- -- end)
--
-- require("mason").setup({})
-- require("mason-lspconfig").setup({
-- 	handlers = {
-- 		function(server_name)
-- 			require("lspconfig")[server_name].setup({})
-- 		end,
-- 	},
-- })
--
-- -- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
-- lsp_zero.setup_servers({ "ts_ls", "lua_ls", "pylsp", "rust_analyzer", "zls", "dprint", "angularls", "yls" })
-- -- vim.filetype.add({
-- -- 	pattern = {
-- -- 		[".*%.component%.html"] = "htmlangular", -- Sets the filetype to `htmlangular` if it matches the pattern
-- -- 	},
-- -- })
--
-- -- Setup auto complete
-- local cmp = require("cmp")
--
-- cmp.setup({
-- 	sources = {
-- 		{ name = "nvim_lsp" },
-- 	},
-- 	snippet = {
-- 		expand = function(args)
-- 			-- You need Neovim v0.10 to use vim.snippet
-- 			vim.snippet.expand(args.body)
-- 		end,
-- 	},
-- 	mapping = cmp.mapping.preset.insert({}),
-- })

-- Neo format
vim.api.nvim_set_keymap("n", "<leader>nf", ":Neoformat<CR>", { noremap = true, silent = true })

vim.filetype.add({ extension = { ejs = "html" } })
-- Neoformat use local prettier rather than global one.
vim.g.neoformat_try_node_exe = 1

-- Consifer ejs as html
vim.g.neoformat_ejs_prettier = {
	exe = "prettier",
	args = { "--parser", "html" },
	stdin = 1,
}

vim.g.neoformat_yaml_yamlfmt = {
	exe = "yamlfmt",
	args = {},
	stdin = 1,
	replace = 1,
}

vim.g.neoformat_enabled_ejs = { "prettier" }

-- Neoformat JS
-- https://prettier.io/docs/en/vim
-- npm install -g prettier required
vim.g.neoformat_enabled_typescript = { "prettier" }
vim.g.neoformat_enabled_javascript = { "prettier" }
vim.g.neoformat_enabled_json = { "prettier" }
vim.g.neoformat_enables_html = { "prettier" }
-- vim.g.neoformat_enables_lua = { "stylua" }

-- https://pypi.org/project/autopep8/
-- pip install --upgrade autopep8
vim.g.neoformat_enabled_python = { "autopep8" }

-- Theme
-- vim.cmd.colorscheme("tokyonight-storm")
-- Default options:
require("gruvbox").setup({
	terminal_colors = true, -- add neovim terminal colors
	undercurl = true,
	underline = true,
	bold = true,
	italic = {
		strings = true,
		emphasis = true,
		comments = true,
		operators = false,
		folds = true,
	},
	strikethrough = true,
	invert_selection = false,
	invert_signs = false,
	invert_tabline = false,
	inverse = true, -- invert background for search, diffs, statuslines and errors
	contrast = "hard", -- can be "hard", "soft" or empty string
	palette_overrides = {},
	overrides = {},
	dim_inactive = false,
	transparent_mode = false,
})
vim.cmd("colorscheme gruvbox")

-- Git diff view
vim.keymap.set("n", "<leader>gd", ":DiffviewOpen<CR>")

-- Setup vertical indentation lines
require("ibl").setup()

require("neoscroll").setup({
	mappings = { -- Keys to be mapped to their corresponding default scrolling animation
		"<C-u>",
		"<C-d>",
		"<C-b>",
		"<C-f>",
		"<C-y>",
		"<C-e>",
		"zt",
		"zz",
		"zb",
	},
	hide_cursor = true, -- Hide cursor while scrolling
	stop_eof = true, -- Stop at <EOF> when scrolling downwards
	respect_scrolloff = false, -- Stop scrolling when the cursor reaches the scrolloff margin of the file
	cursor_scrolls_alone = true, -- The cursor will keep on scrolling even if the window cannot scroll further
	duration_multiplier = 1.0, -- Global duration multiplier
	easing = "linear", -- Default easing function
	pre_hook = nil, -- Function to run before the scrolling animation starts
	post_hook = nil, -- Function to run after the scrolling animation ends
	performance_mode = true, -- Disable "Performance Mode" on all buffers.
	ignored_events = { -- Events ignored while scrolling
		"WinScrolled",
		"CursorMoved",
	},
})

neoscroll = require("neoscroll")
local keymap = {
	["<C-s>"] = function()
		neoscroll.scroll(-0.5, { move_cursor = true, duration = 50 })
	end,
	["<C-x>"] = function()
		neoscroll.scroll(0.5, { move_cursor = true, duration = 50 })
	end,
}
local modes = { "n", "v", "x" }
for key, func in pairs(keymap) do
	vim.keymap.set(modes, key, func)
end

-- Barbar mappings
local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- Move to previous/next
map("n", "<A-,>", "<Cmd>BufferPrevious<CR>", opts)
map("n", "<A-.>", "<Cmd>BufferNext<CR>", opts)

-- Telescope ui select setup
-- This is your opts table
require("telescope").setup({
	extensions = {
		["ui-select"] = {
			require("telescope.themes").get_dropdown({
				-- even more opts
			}),

			-- pseudo code / specification for writing custom displays, like the one
			-- for "codeactions"
			-- specific_opts = {
			--   [kind] = {
			--     make_indexed = function(items) -> indexed_items, width,
			--     make_displayer = function(widths) -> displayer
			--     make_display = function(displayer) -> function(e)
			--     make_ordinal = function(e) -> string
			--   },
			--   -- for example to disable the custom builtin "codeactions" display
			--      do the following
			--   codeactions = false,
			-- }
		},
	},
})
-- To get ui-select loaded and working with telescope, you need to call
-- load_extension, somewhere after setup function:
require("telescope").load_extension("ui-select")

-- Gen keymaps
vim.keymap.set({ "n", "v" }, "<leader>]", ":Gen<CR>")
vim.keymap.set({ "n", "v" }, "<leader>]]", ":Gen Chat<CR>")

require("image").setup({
	backend = "ueberzug", -- or "ueberzug" or "sixel"
	processor = "magick_cli", -- or "magick_rock"
	integrations = {
		markdown = {
			enabled = true,
			clear_in_insert_mode = false,
			download_remote_images = true,
			only_render_image_at_cursor = false,
			only_render_image_at_cursor_mode = "popup", -- or "inline"
			floating_windows = false, -- if true, images will be rendered in floating markdown windows
			filetypes = { "markdown", "vimwiki" }, -- markdown extensions (ie. quarto) can go here
		},
		neorg = {
			enabled = true,
			filetypes = { "norg" },
		},
		typst = {
			enabled = true,
			filetypes = { "typst" },
		},
		html = {
			enabled = false,
		},
		css = {
			enabled = false,
		},
	},
	max_width = nil,
	max_height = nil,
	max_width_window_percentage = nil,
	max_height_window_percentage = 50,
	scale_factor = 1.0,
	window_overlap_clear_enabled = false, -- toggles images when windows are overlapped
	window_overlap_clear_ft_ignore = { "cmp_menu", "cmp_docs", "snacks_notif", "scrollview", "scrollview_sign" },
	editor_only_render_when_focused = false, -- auto show/hide images when the editor gains/looses focus
	tmux_show_only_in_active_window = false, -- auto show/hide images in the correct Tmux window (needs visual-activity off)
	hijack_file_patterns = { "*.png", "*.jpg", "*.jpeg", "*.gif", "*.webp", "*.avif" }, -- render image files as images when opened
})
