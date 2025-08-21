vim.g.mapleader = " "

require("configs.options")

-- Plugins
require("configs.lazy")

-- KeyMaps and Tooling
vim.o.timeoutlen = 5000

require("mappings")

require "tools.switch_case"
vim.api.nvim_set_keymap('n', '<Leader>sc', '<cmd>lua require("tools.switch_case").switch_case()<CR>', {noremap = true, silent = true})

require "hello"

-- styling settings

require('lualine').setup({
    options = {
        component_separators = '',
        section_separators = '',
        disabled_filetypes = {},
        transparent = true,
    },
	  sections = {
	 	lualine_x = { { "fileformat", symbols = { unix = "𐂂  ♡  𖤠 𐂯" } }, "filetype" },
	  },
})

vim.cmd("colorscheme everforest")
