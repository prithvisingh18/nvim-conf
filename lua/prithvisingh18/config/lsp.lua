local on_attach = function(_, bufnr)
	local opts = { buffer = bufnr, silent = true, noremap = true }
	local map = vim.keymap.set

	map("n", "gd", vim.lsp.buf.definition, opts)
	map("n", "<leader>gD", vim.lsp.buf.declaration, opts)
	map("n", "gr", vim.lsp.buf.references, opts)
	map("n", "gi", vim.lsp.buf.implementation, opts)
	map("n", "K", vim.lsp.buf.hover, opts)
	map("n", "<leader>rn", vim.lsp.buf.rename, opts)
	map("n", "<leader>ca", vim.lsp.buf.code_action, opts)
end

-- Configure a server via `vim.lsp.config()` or `{after/}lsp/lua_ls.lua`
vim.lsp.config("lua_ls", {
	on_attach = on_attach,
	capabilities = require("cmp_nvim_lsp").default_capabilities(),
	settings = {
		Lua = {
			runtime = {
				version = "LuaJIT",
			},
			diagnostics = {
				globals = {
					"vim",
					"require",
				},
			},
		},
	},
})

vim.lsp.config("ts_ls", {
	-- Use your existing on_attach function
	on_attach = on_attach, -- ASSUMING you move on_attach to a separate file
	-- Pass capabilities to the server
	capabilities = require("cmp_nvim_lsp").default_capabilities(),
	-- Add ts_ls specific settings here
	settings = {
		typescript = {
			inlayHints = {
				includeInlayParameterNameHints = "all",
				includeInlayFunctionParameterTypeHints = true,
				includeInlayVariableTypeHints = true,
				includeInlayVariableTypeHintsWhenTypeMatchesName = false,
				includeInlayPropertyDeclarationTypeHints = true,
				includeInlayFunctionLikeReturnTypeHints = true,
				includeInlayEnumMemberValueHints = true,
			},
		},
		javascript = {
			inlayHints = {
				includeInlayParameterNameHints = "all",
				-- Use similar settings for javascript here
			},
		},
	},
})

vim.lsp.config("angularls", {
	root_dir = function(filename)
		return vim.fs.root(filename, { "angular.json", "project.json", "nx.json" }) or vim.loop.cwd()
	end,
})

require("mason").setup()
-- Note: `nvim-lspconfig` needs to be in 'runtimepath' by the time you set up mason-lspconfig.nvim
require("mason-lspconfig").setup({
	ensure_installed = { "pyright", "ts_ls", "html", "bashls", "rust_analyzer", "angularls" },
})

