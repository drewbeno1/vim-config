return {
  "nvim-tree/nvim-tree.lua",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    require("nvim-tree").setup({
      view = {
        width = 30,
      },
      -- oil is main, but this is still an option
      update_focused_file = {
        enable = true,
        update_cwd = false,
      },
    })

    vim.keymap.set("n", "<C-n>", ":NvimTreeToggle<CR>", { 
      silent = true, 
      noremap = true, 
      desc = "NvimTree Toggle window" 
    })
  end,
}
