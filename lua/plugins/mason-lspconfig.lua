return {
  "williamboman/mason-lspconfig.nvim",
  dependencies = { "williamboman/mason.nvim" },
  config = function()
    require("mason-lspconfig").setup({
      ensure_installed = { 
        "cssls", "dockerls", "html", "ts_ls", "tailwindcss", "lua_ls", "pyright", "yamlls"
        -- run :MasonInstall vue-language-server separately
      },
      automatic_installation = true,
      automatic_enable = false,  -- Disable automatic enabling to avoid the error
    })
  end,
}
