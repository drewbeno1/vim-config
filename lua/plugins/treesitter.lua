-- lua/plugins/treesitter.lua
return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  event = { "BufReadPost", "BufNewFile" },
  opts = {
    ensure_installed = {
      "css","csv","diff","dockerfile","go","gitignore","graphql","html","htmldjango", "ini",
      "javascript","json","lua","make","markdown","markdown_inline","python",
      "sql","toml","tsx","typescript","vim","vimdoc","vue","xml","yaml","query"
    },
    auto_install = true,
    highlight = {
      enable = true,
      additional_vim_regex_highlighting = false,
    },
    incremental_selection = { enable = true },
    indent = { enable = true },
  },
  config = function(_, opts)
    require("nvim-treesitter.configs").setup(opts)
  end,
}
