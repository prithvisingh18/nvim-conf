-- Neotree setup
-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- optionally enable 24-bit colour
vim.opt.termguicolors = true

-- Neotree
vim.keymap.set("n", "<leader>b", vim.cmd.Neotree)
vim.keymap.set("n", "<leader>bl", ":Neotree focus buffers<CR>")
vim.keymap.set("n", "<leader>bf", ":Neotree focus filesystem<CR>")
vim.keymap.set("n", "<leader>bg", ":Neotree focus git_status<CR>")
vim.keymap.set("n", "<leader>ba", ":Neotree focus last<CR>")


require("neo-tree").setup({
    window = {
        mappings = {
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
            end
        }
    }
})



local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>tf", ":Telescope find_files theme=dropdown<CR>")
vim.keymap.set("n", "<leader>tg", ":Telescope live_grep theme=ivy<CR>")
vim.keymap.set("n", "<leader>tb", ":Telescope buffers theme=dropdown<CR>")
vim.keymap.set("n", "<leader>te", ":Telescope file_browser theme=ivy<CR>")
vim.keymap.set("n", "<leader>tj", ":Telescope jumplist theme=dropdown<CR>")
vim.keymap.set("n", "<leader>ts", ":Telescope git_status theme=ivy<CR>")
vim.keymap.set("n", "<leader>th", builtin.help_tags, {})

-- Configure zero lsp, copied from
-- https://lsp-zero.netlify.app/v4.x/tutorial.html#setup-lsp-zero
local lsp_zero = require("lsp-zero")


-- lsp_attach is where you enable features that only work
-- if there is a language server active in the file
local lsp_attach = function(client, bufnr)
    local opts = { buffer = bufnr }

    vim.keymap.set("n", "K", "<cmd>lua vim.lsp.buf.hover()<cr>", opts)
    vim.keymap.set("n", "gd", "<cmd>lua vim.lsp.buf.definition()<cr>", opts)
    vim.keymap.set("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<cr>", opts)
    vim.keymap.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<cr>", opts)
    vim.keymap.set("n", "go", "<cmd>lua vim.lsp.buf.type_definition()<cr>", opts)
    vim.keymap.set("n", "gr", "<cmd>lua vim.lsp.buf.references()<cr>", opts)
    vim.keymap.set("n", "gs", "<cmd>lua vim.lsp.buf.signature_help()<cr>", opts)
    vim.keymap.set("n", "<F2>", "<cmd>lua vim.lsp.buf.rename()<cr>", opts)
    vim.keymap.set({ "n", "x" }, "ff", "<cmd>lua vim.lsp.buf.format({async = true})<cr>", opts)
    vim.keymap.set("n", "<F4>", "<cmd>lua vim.lsp.buf.code_action()<cr>", opts)
end

lsp_zero.extend_lspconfig({
    sign_text = true,
    lsp_attach = lsp_attach,
    capabilities = require("cmp_nvim_lsp").default_capabilities(),
})


-- lsp_zero.on_attach(function(client, bufnr)
--   lsp_zero.default_keymaps({buffer = bufnr})
-- end)

require("mason").setup({})
require("mason-lspconfig").setup({
    handlers = {
        function(server_name)
            require("lspconfig")[server_name].setup({})
        end,
    },
})

-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
lsp_zero.setup_servers({ "ts_ls", "lua_ls", "rust_analyzer", "pylsp" })

-- Setup auto complete
local cmp = require("cmp")

cmp.setup({
    sources = {
        { name = "nvim_lsp" },
    },
    snippet = {
        expand = function(args)
            -- You need Neovim v0.10 to use vim.snippet
            vim.snippet.expand(args.body)
        end,
    },
    mapping = cmp.mapping.preset.insert({}),
})

-- Neo format
vim.api.nvim_set_keymap("n", "<leader>nf", ":Neoformat<CR>", { noremap = true, silent = true })

-- Neoformat use local prettier rather than global one.
vim.g.neoformat_try_node_exe = 1

-- Neoformat JS
-- https://prettier.io/docs/en/vim
-- npm install -g prettier required
vim.g.neoformat_enabled_typescript = { "prettier" }
vim.g.neoformat_enabled_javascript = { "prettier" }
vim.g.neoformat_enabled_json = { "prettier" }


-- https://pypi.org/project/autopep8/
-- pip install --upgrade autopep8
vim.g.neoformat_enabled_python = { "autopep8" }


-- Theme settings
-- vim.cmd.colorscheme("tokyonight-night")
vim.cmd.colorscheme("cyberdream")



