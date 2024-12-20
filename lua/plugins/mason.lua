return {
  {
    "williamboman/mason.nvim",
    cmd = "Mason",
    config = function()
      require("mason").setup()
    end
  },
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = {
      "williamboman/mason.nvim"
    },
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = {
          "cssls",
          "dockerls",
          "gopls",
          "html",
          "ts_ls",
          "vuels",
          "yamlls",
	  -- "vue-language-server",
	  -- ^ not allowed in ensure_installed. just run ":MasonInstall vue-language-server
          "tailwindcss",
          "lua_ls",
          "pyright",
        },
        automatic_installation = true,
      })
    end
  }
}

