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
        theme = 'kanagawa',
        component_separators = '|',
        section_separators = '',
        disabled_filetypes = {},
        transparent = true,
    }
})

require('kanagawa').setup({
    colors = {
        theme = {
            all = {
                ui = {
                    bg_gutter = "none"
                }
            }
        }
    }
})

-- setup must be called before loading
vim.cmd("colorscheme kanagawa")
