local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})


-- Configure zero lsp, copied from
-- https://lsp-zero.netlify.app/v4.x/tutorial.html#setup-lsp-zero
local lsp_zero = require('lsp-zero')


lsp_zero.on_attach(function(client, bufnr)
  lsp_zero.default_keymaps({buffer = bufnr})
end)

require('mason').setup({})
require('mason-lspconfig').setup({
  handlers = {
    function(server_name)
      require('lspconfig')[server_name].setup({})
    end,
  },
})

lsp_zero.setup_servers({'tsserver', 'lua_ls', 'rust_analyzer'})

vim.api.nvim_set_keymap('n', '<leader>ff', ':Neoformat<CR>', { noremap = true, silent = true })
