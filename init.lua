vim.g.mapleader = " "

require("configs.options")

-- Plugins
require("configs.lazy")

-- KeyMaps and Tooling
require("mappings")

require "tools.switch_case"
vim.api.nvim_set_keymap('n', '<Leader>sc', '<cmd>lua require("tools.switch_case").switch_case()<CR>', {noremap = true, silent = true})

require "hello"

require('lualine').setup {}

vim.o.timeoutlen = 5000
