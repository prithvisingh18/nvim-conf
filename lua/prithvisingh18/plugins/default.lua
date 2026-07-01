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
	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		opts = {
			transparent = true,
			styles = {
				sidebars = "transparent",
				floats = "transparent",
			},
		},
	},
	-- { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
	-- { "ellisonleao/gruvbox.nvim", priority = 1000, config = true },
	-- {
	-- 	"rose-pine/neovim",
	-- 	name = "rose-pine",
	-- 	config = function()
	-- 		vim.cmd("colorscheme rose-pine")
	-- 	end,
	-- },
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
	-- 	"coder/claudecode.nvim",
	-- 	dependencies = {
	-- 		"nvim-lua/plenary.nvim",
	-- 		"folke/snacks.nvim", -- Optional, but recommended for UI elements
	-- 	},
	-- 	opts = {
	-- 		terminal = {
	-- 			-- "none" means you will run `claude --ide` in an external terminal/tmux
	-- 			provider = "none",
	-- 		},
	-- 		-- If 'claude' isn't in your system PATH, uncomment and set the path below:
	-- 		-- terminal_cmd = "/usr/local/bin/claude",
	-- 	},
	-- 	keys = {
	-- 		-- Essential keys for the external workflow
	-- 		{ "<leader>ad", "<cmd>ClaudeCodeDiffDeny<cr>", desc = "Claude: Deny Diff" },
	-- 		{ "<leader>aa", "<cmd>ClaudeCodeDiffAccept<cr>", desc = "Claude: Accept Diff" },
	-- 		-- Since provider is "none", this command starts the Neovim side of the bridge
	-- 		{ "<leader>as", "<cmd>ClaudeCode<cr>", desc = "Claude: Start Bridge" },
	-- 	},
	-- },
	-- {
	-- 	"koushikxd/resu.nvim",
	-- 	-- dependencies = {
	-- 	-- 	"sindrets/diffview.nvim",
	-- 	-- },
	-- 	config = function()
	-- 		require("resu").setup({
	-- 			use_diffview = false,
	-- 			hot_reload = true,
	-- 			debounce_ms = 100,
	-- 			watch_dir = nil,
	-- 			ignored_files = {
	-- 				"%.git/",
	-- 				"node_modules/",
	-- 				"dist/",
	-- 				"build/",
	-- 				"%.DS_Store",
	-- 				"%.swp",
	-- 			},
	-- 			keymaps = {
	-- 				toggle = "<leader>rt",
	-- 				accept = "<leader>ra",
	-- 				decline = "<leader>rd",
	-- 				accept_all = "<leader>rA",
	-- 				decline_all = "<leader>rD",
	-- 				refresh = "<leader>rr",
	-- 				quit = "q",
	-- 			},
	-- 		})
	-- 	end,
	-- },
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

		{
			"karb94/neoscroll.nvim",
			config = function()
				require("neoscroll").setup({
					-- Time telling the animation how long to take (in milliseconds)
					easing = "linear", -- Smooth acceleration and deceleration
					hide_cursor = true, -- Hide cursor while scrolling to prevent flickering
					stop_eof = true, -- Stop scrolling at the end of the file
					respect_scrolloff = false, -- Inside splits, ignore scrolloff boundaries
					cursor_scrolls_alone = true, -- The cursor moves along with the screen
					-- Global easing function presets: "linear", "quadratic", "cubic", "sine", "circular"
					easing_function = "linear",
					duration_multiplier = 1.0, -- Global duration multiplier
					pre_hook = nil, -- Function to run before the scrolling animation starts
					post_hook = nil, -- Function to run after the scrolling animation ends
					performance_mode = true, -- Disable "Performance Mode" on all buffers.
					ignored_events = { -- Events ignored while scrolling
						"WinScrolled",
						"CursorMoved",
					},
				})
				local neoscroll = require("neoscroll")
				local keymap = {
					["<C-u>"] = function()
						neoscroll.ctrl_u({ duration = 150, easing = "linear" })
					end,
					["<C-d>"] = function()
						neoscroll.ctrl_d({ duration = 150, easing = "linear" })
					end,
					["<C-s>"] = function()
						neoscroll.ctrl_u({ duration = 150, easing = "linear" })
					end,
					["<C-x>"] = function()
						neoscroll.ctrl_d({ duration = 150, easing = "linear" })
					end,
					["<C-b>"] = function()
						neoscroll.ctrl_b({ duration = 250, easing = "linear" })
					end,
					["<C-f>"] = function()
						neoscroll.ctrl_f({ duration = 250, easing = "linear" })
					end,
					["<C-y>"] = function()
						neoscroll.scroll(-0.10, { move_cursor = false, duration = 80 })
					end,
					["<C-e>"] = function()
						neoscroll.scroll(0.10, { move_cursor = false, duration = 80 })
					end,
					["<M-k>"] = function()
						neoscroll.scroll(-0.10, { move_cursor = false, duration = 80 })
					end,
					["<M-j>"] = function()
						neoscroll.scroll(0.10, { move_cursor = false, duration = 80 })
					end,
					["zt"] = function()
						neoscroll.zt({ half_win_duration = 150 })
					end,
					["zz"] = function()
						neoscroll.zz({ half_win_duration = 150 })
					end,
					["zb"] = function()
						neoscroll.zb({ half_win_duration = 150 })
					end,
					["<ScrollWheelUp>"] = function()
						neoscroll.scroll(-0.10, { move_cursor = false, duration = 50, easing = "linear" })
					end,
					["<ScrollWheelDown>"] = function()
						neoscroll.scroll(0.10, { move_cursor = false, duration = 50, easing = "linear" })
					end,
				}

				local modes = { "n", "v", "x" }
				for key, func in pairs(keymap) do
					vim.keymap.set(modes, key, func, { silent = true, noremap = true })
				end
			end,
		},
	},
	-- {
	-- 	"mrcjkb/rustaceanvim",
	-- 	version = "^5", -- Recommended
	-- 	lazy = false, -- This plugin is already lazy
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
	-- {
	-- 	"f-person/git-blame.nvim",
	-- 	-- load the plugin at startup
	-- 	event = "VeryLazy",
	-- 	-- Because of the keys part, you will be lazy loading this plugin.
	-- 	-- The plugin will only load once one of the keys is used.
	-- 	-- If you want to load the plugin at startup, add something like event = "VeryLazy",
	-- 	-- or lazy = false. One of both options will work.
	-- 	opts = {
	-- 		-- your configuration comes here
	-- 		-- for example
	-- 		enabled = true, -- if you want to enable the plugin
	-- 		message_template = " <summary> • <date> • <author> • <<sha>>", -- template for the blame message, check the Message template section for more options
	-- 		date_format = "%m-%d-%Y %H:%M:%S", -- template for the date, check Date format section for more options
	-- 		virtual_text_column = 1, -- virtual text start column, check Start virtual text at column section for more options
	-- 	},
	-- },
	{
		"3rd/image.nvim",
		build = false, -- so that it doesn't build the rock https://github.com/3rd/image.nvim/issues/91#issuecomment-2453430239
		opts = {
			processor = "magick_cli",
		},
	},
	{
		"linux-cultist/venv-selector.nvim",
		dependencies = {
			"neovim/nvim-lspconfig",
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope.nvim", -- Requires a picker like Telescope
		},
		config = function()
			require("venv-selector").setup({
				-- Your configuration options here
			})
		end,
	},
	{
		"nickjvandyke/opencode.nvim",
		version = "*", -- Latest stable release
		config = function()
			---@type opencode.Opts
			vim.g.opencode_opts = {
				-- Your configuration, if any; goto definition on the type for details
			}

			vim.o.autoread = true -- Required for `vim.g.opencode_opts.events.reload`

			-- Recommended/example keymaps
			vim.keymap.set({ "n", "x" }, "<leader>oa", function()
				require("opencode").ask("@this: ")
			end, { desc = "Ask OpenCode…" })
			vim.keymap.set({ "n", "x" }, "<leader>os", function()
				require("opencode").select()
			end, { desc = "Select OpenCode…" })

			vim.keymap.set({ "n", "x" }, "go", function()
				return require("opencode").operator("@this ")
			end, { desc = "Append range to OpenCode", expr = true })
			vim.keymap.set("n", "goo", function()
				return require("opencode").operator("@this ") .. "_"
			end, { desc = "Append line to OpenCode", expr = true })

			vim.keymap.set("n", "<S-C-u>", function()
				require("opencode").command("session.half.page.up")
			end, { desc = "Scroll OpenCode up" })
			vim.keymap.set("n", "<S-C-d>", function()
				require("opencode").command("session.half.page.down")
			end, { desc = "Scroll OpenCode down" })
		end,
	},
}
