return {
  "ggandor/leap.nvim",
  lazy = false,
  config = function()
    require ("leap").setup{}
    vim.api.nvim_set_keymap('n', 's', "<Plug>(leap-forward-to)", {})
    vim.api.nvim_set_keymap('n', 'z', "<Plug>(leap-backward-to)", {})
  end,
}

