print("Starting configuration")

-- Remaping vim commands
require("prithvisingh18.remap")

-- Initialize lazy
require("prithvisingh18.lazy")

-- Remap plugin related shortcuts
require("prithvisingh18.plugin_remap")


vim.opt.termguicolors = true
vim.cmd.colorscheme('tokyonight')

print("Configured.")
