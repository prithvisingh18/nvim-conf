return {
	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
			"MunifTanjim/nui.nvim",
			"3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
		},
	},
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.8",
		dependencies = { "nvim-lua/plenary.nvim" },
	},
	{
		"nvim-telescope/telescope-file-browser.nvim",
		dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
	},
	-- {
	-- 	"folke/tokyonight.nvim",
	-- 	lazy = false,
	-- 	priority = 1000,
	-- 	opts = {
	-- 		transparent = true,
	-- 		styles = {
	-- 			sidebars = "transparent",
	-- 			floats = "transparent",
	-- 		},
	-- 	},
	-- },
	-- { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
	{ "ellisonleao/gruvbox.nvim", priority = 1000, config = true },
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		config = function()
			local configs = require("nvim-treesitter.configs")
			configs.setup({
				ensure_installed = {
					"c",
					"lua",
					"vim",
					"vimdoc",
					"query",
					"elixir",
					"heex",
					"javascript",
					"typescript",
					"html",
					"rust",
					"python",
					"zig",
					"markdown",
					"markdown_inline",
					"angular",
					-- "toml"
				},
				sync_install = false,
				auto_install = true,
				highlight = { enable = true },
				indent = { enable = true },
			})
		end,
	},
	{
		"sbdchd/neoformat",
	},
	{
		"mg979/vim-visual-multi",
	},
	{
		"sindrets/diffview.nvim",
	},
	{
		"sindrets/winshift.nvim",
		keys = {
			{ "<leader>wm", "<cmd>WinShift<cr>", desc = "Move window" },
		},
		config = true,
	},
	{
		"folke/zen-mode.nvim",
		config = function()
			require("zen-mode").setup({
				window = {
					width = 0.70, -- Adjust the width to your liking
				},
			})
		end,
	},
	{
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
		opts = {},
	},
	-- {
	-- 	"David-Kunz/gen.nvim",
	-- 	-- "prithvisingh18/gen.nvim",
	-- 	-- dir = "~/Documents/ps_workspace/gen.nvim",
	-- 	-- branch = "no-split",
	-- 	opts = {
	-- 		model = "deepseek-r1:8b",
	-- 		display_mode = "split",
	-- 		show_prompt = "full",
	-- 		show_model = true,
	-- 		quit_map = "q", -- set keymap to close the response window
	-- 		retry_map = "<c-r>", -- set keymap to re-send the current prompt
	-- 		accept_map = "<c-cr>", -- set keymap to replace the previous selection with the last result
	-- 		no_auto_close = false, -- Never closes the window automatically.
	-- 		file = true, -- Write the payload to a temporary file to keep the command short.
	-- 		hidden = false, -- Hide the generation window (if true, will implicitly set `prompt.replace = true`), requires Neovim >= 0.10
	-- 	},
	-- },
	{
		"karb94/neoscroll.nvim",
		opts = {},
	},
	-- {
	-- 	"mrcjkb/rustaceanvim",
	-- 	version = "^5", -- Recommended
	-- 	lazy = false, -- This plugin is already lazy
	-- },
	-- {
	-- 	"romgrk/barbar.nvim",
	-- 	dependencies = {
	-- 		"lewis6991/gitsigns.nvim", -- OPTIONAL: for git status
	-- 		"nvim-tree/nvim-web-devicons", -- OPTIONAL: for file icons
	-- 	},
	-- 	init = function()
	-- 		vim.g.barbar_auto_setup = false
	-- 	end,
	-- 	opts = {
	-- 		sidebar_filetypes = {
	-- 			["neo-tree"] = { event = "BufWipeout" },
	-- 		},
	-- 	},
	-- 	version = "^1.0.0", -- optional: only update when a new 1.x version is released
	-- },
	{ "nvim-telescope/telescope-ui-select.nvim" },
	-- {
	-- 	"folke/flash.nvim",
	-- 	event = "VeryLazy",
	-- 	opts = {},
	--        -- stylua: ignore
	--        keys = {
	--            { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
	--            { "S", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
	--        },
	-- },
	{
		"f-person/git-blame.nvim",
		-- load the plugin at startup
		event = "VeryLazy",
		-- Because of the keys part, you will be lazy loading this plugin.
		-- The plugin will only load once one of the keys is used.
		-- If you want to load the plugin at startup, add something like event = "VeryLazy",
		-- or lazy = false. One of both options will work.
		opts = {
			-- your configuration comes here
			-- for example
			enabled = true, -- if you want to enable the plugin
			message_template = " <summary> • <date> • <author> • <<sha>>", -- template for the blame message, check the Message template section for more options
			date_format = "%m-%d-%Y %H:%M:%S", -- template for the date, check Date format section for more options
			virtual_text_column = 1, -- virtual text start column, check Start virtual text at column section for more options
		},
	},
}
