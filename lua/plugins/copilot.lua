_G.copilot_enabled = false
_G.copilot_initialized = false

-- Command to enable Copilot
vim.api.nvim_create_user_command('EnableCopilot', function()
  _G.copilot_enabled = true
  if not _G.copilot_initialized then
    require("copilot").setup()
    require("copilot_cmp").setup()
    _G.copilot_initialized = true
  end
end, {})

return {
  {
    "zbirenbaum/copilot.lua",
    event = "InsertEnter",
    build = ":Copilot auth",
    opts = {
      filetypes = {
        ["*"] = true,
      },
    },
    config = function(_, opts)
      if _G.copilot_enabled then
        require("copilot").setup(opts)
      end
    end,
  },
  {
    "zbirenbaum/copilot-cmp",
    lazy = false,
    dependencies = {
      "hrsh7th/nvim-cmp",
      "zbirenbaum/copilot.lua",
    },
    config = function()
      if _G.copilot_enabled then
        require("copilot_cmp").setup()
      end
    end,
  },
}

