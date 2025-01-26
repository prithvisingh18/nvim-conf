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
	-- {
	-- 	"folke/tokyonight.nvim",
	-- 	lazy = false,
	-- 	priority = 1000,
	-- 	opts = {},
	-- },
	{ "catppuccin/nvim", name = "catppuccin", priority = 1000 },
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
		"Kurama622/llm.nvim",
		dependencies = { "nvim-lua/plenary.nvim", "MunifTanjim/nui.nvim" },
		cmd = { "LLMSessionToggle", "LLMSelectedTextHandler" },
		config = function()
			require("llm").setup({
				prompt = "You are a helpful programming assistant.",
				prefix = {
					user = { text = "😃 ", hl = "Title" },
					assistant = { text = "⚡ ", hl = "Added" },
				},
				style = "float", -- right | left | above | below | float
				-- [[ ollama ]]
				url = "http://localhost:11434/api/chat",
				model = "deepseek-r1:8b",
				api_type = "ollama",
				max_tokens = 1024,
				save_session = true,
				max_history = 15,
				history_path = "/tmp/history", -- where to save history
				temperature = 0.3,
				top_p = 0.7,
				spinner = {
					text = {
						"󰧞󰧞",
						"󰧞󰧞",
						"󰧞󰧞",
						"󰧞󰧞",
					},
					hl = "Title",
				},
				display = {
					diff = {
						layout = "vertical", -- vertical|horizontal split for default provider
						opts = { "internal", "filler", "closeoff", "algorithm:patience", "followwrap", "linematch:120" },
						provider = "mini_diff", -- default|mini_diff
					},
				},

        -- stylua: ignore
        keys = {
          -- The keyboard mapping for the input window.
          ["Input:Cancel"]      = { mode = "n", key = "<C-c>" },
          ["Input:Submit"]      = { mode = "n", key = "<cr>" },
          ["Input:Resend"]      = { mode = "n", key = "<C-r>" },

          -- only works when "save_session = true"
          ["Input:HistoryNext"] = { mode = "n", key = "<C-j>" },
          ["Input:HistoryPrev"] = { mode = "n", key = "<C-k>" },

          -- The keyboard mapping for the output window in "split" style.
          ["Output:Ask"]        = { mode = "n", key = "i" },
          ["Output:Cancel"]     = { mode = "n", key = "<C-c>" },
          ["Output:Resend"]     = { mode = "n", key = "<C-r>" },

          -- The keyboard mapping for the output and input windows in "float" style.
          ["Session:Toggle"]    = { mode = "n", key = "<leader>ac" },
          ["Session:Close"]     = { mode = "n", key = "<esc>" },
        },
			})
		end,
		keys = {
			{ "<leader>ac", mode = "n", "<cmd>LLMSessionToggle<cr>" },
			{ "<leader>ae", mode = "v", "<cmd>LLMSelectedTextHandler<cr>" },
			{ "<leader>t", mode = "x", "<cmd>LLMSelectedTextHandler<cr>" },
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
}
