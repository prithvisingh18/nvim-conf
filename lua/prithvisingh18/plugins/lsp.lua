-- return {
--     {
--         "VonHeikemen/lsp-zero.nvim",
--         branch = "v4.x"
--     },
--     { "neovim/nvim-lspconfig", },
--     { "hrsh7th/cmp-nvim-lsp" },
--     { "hrsh7th/nvim-cmp" },
--     { "williamboman/mason.nvim", },
--     { "williamboman/mason-lspconfig.nvim" },
--     { "hrsh7th/cmp-buffer" },
--     { "saadparwaiz1/cmp_luasnip" },
--     { "L3MON4D3/LuaSnip" },
--     { "rafamadriz/friendly-snippets" }
-- }

return {
	-- Mason: LSP/DAP/Formatter installer
	{ "williamboman/mason.nvim", config = true },

	-- Bridges Mason → LSP config
	{ "williamboman/mason-lspconfig.nvim" },

	-- Core LSP setup (needed until Neovim 0.12)
	{ "neovim/nvim-lspconfig" },

	-- Autocompletion engine
	{ "hrsh7th/nvim-cmp" },

	-- LSP completion source
	{ "hrsh7th/cmp-nvim-lsp" },

	-- Buffer words completion
	{ "hrsh7th/cmp-buffer" },

	-- Snippet engine + integration
	{ "L3MON4D3/LuaSnip" },
	{ "saadparwaiz1/cmp_luasnip" },

	-- Community snippets
	{ "rafamadriz/friendly-snippets" },
}

