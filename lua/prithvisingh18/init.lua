print("Starting configuration")

-- Enables 24 bit colors in the terminal
vim.opt.termguicolors = true

-- Remaping vim commands
require("prithvisingh18.remap")

-- Initialize lazy
require("prithvisingh18.lazy")

-- Remap plugin related shortcuts
require("prithvisingh18.plugin_remap")

print("Configured.")
