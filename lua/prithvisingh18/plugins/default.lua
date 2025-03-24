return {
	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
			"MunifTanjim/nui.nvim",
			-- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
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
	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		opts = {},
	},
	-- { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
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
					width = 120, -- Adjust the width to your liking
				},
			})
		end,
	},
	{
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
		opts = {},
	},
	{
		"David-Kunz/gen.nvim",
		opts = {
			model = "deepseek-r1:8b",
			display_mode = "horizontal-split",
			show_prompt = "Full",
			show_model = true,
		},
	},
	{
		"karb94/neoscroll.nvim",
		opts = {},
	},
	-- {
	-- 	"mrcjkb/rustaceanvim",
	-- 	version = "^5", -- Recommended
	-- 	lazy = false, -- This plugin is already lazy
	-- },
	{
		"romgrk/barbar.nvim",
		dependencies = {
			"lewis6991/gitsigns.nvim", -- OPTIONAL: for git status
			"nvim-tree/nvim-web-devicons", -- OPTIONAL: for file icons
		},
		init = function()
			vim.g.barbar_auto_setup = false
		end,
		opts = {
			sidebar_filetypes = {
				["neo-tree"] = { event = "BufWipeout" },
			},
		},
		version = "^1.0.0", -- optional: only update when a new 1.x version is released
	},
}
