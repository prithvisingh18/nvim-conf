-- ==============================
-- Modern Neovim 0.11+ LSP Setup
-- ==============================

-- vim.lsp.config["luals"] = {
-- 	-- Command and arguments to start the server.
-- 	cmd = { "lua-language-server" },
-- 	-- Filetypes to automatically attach to.
-- 	filetypes = { "lua" },
-- 	-- Sets the "workspace" to the directory where any of these files is found.
-- 	-- Files that share a root directory will reuse the LSP server connection.
-- 	-- Nested lists indicate equal priority, see |vim.lsp.Config|.
-- 	root_markers = { { ".luarc.json", ".luarc.jsonc" }, ".git" },
-- 	-- Specific settings to send to the server. The schema is server-defined.
-- 	-- Example: https://raw.githubusercontent.com/LuaLS/vscode-lua/master/setting/schema.json
-- 	settings = {
-- 		Lua = {
-- 			runtime = {
-- 				version = "LuaJIT",
-- 			},
-- 		},
-- 	},
-- }
--
-- 1️⃣ Mason: Installer for language servers
require("mason").setup()

-- 2️⃣ Auto-install + setup servers via Mason-LSPConfig
require("mason-lspconfig").setup({
	ensure_installed = { "pyright", "ts_ls", "html", "bashls" },
	handlers = {
		-- Default setup for all servers
		function(server)
			vim.lsp.config[server].setup({
				capabilities = require("cmp_nvim_lsp").default_capabilities(),
			})
		end,
	},
})
--
-- 3️⃣ Custom keymaps for LSP actions
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

-- Optional: attach keymaps automatically to every LSP buffer
vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(args)
		local client = vim.lsp.get_client_by_id(args.data.client_id)
		if client then
			on_attach(client, args.buf)
		end
	end,
})

