return {
  "stevearc/oil.nvim",
  opts = {},
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    require("oil").setup({
      default_file_explorer = true,
    })
  end,
}

-- Editting = just like regular vim (dd to delete and stuff)
-- Enter = move down in directories or open file 
-- ! = open Oil or move back in directories
-- g. = see/hide hidden files 
-- g? = see commands
