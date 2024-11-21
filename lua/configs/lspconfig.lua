-- LSPs without configuration
local default_servers = {
  "cssls",
  "dockerls",
  "html",
  "vimls",
  "tailwindcss",
}

local lspconfig = require "lspconfig"
local on_attach = require("tools.lsphelpers").on_attach
local on_init = require("tools.lsphelpers").on_init
local capabilities = require("tools.lsphelpers").capabilities
local vue_language_server_path = vim.fn.expand("~/.local/share/nvim/mason/packages/vue-language-server/node_modules/@vue/language-server/bin/vue-language-server.js")
local typescript_path = vim.fn.expand("~/.local/share/nvim/mason/packages/typescript-language-server/node_modules/typescript/lib")

for _, lsp in ipairs(default_servers) do
  ---@diagnostic disable-next-line: undefined-field
  lspconfig[lsp].setup {
    on_attach = on_attach,
    on_init = on_init,
    capabilities = capabilities,
  }
end

lspconfig.ts_ls.setup {
  on_attach = on_attach,
  on_init = on_init,
  capabilities = capabilities,
  init_options = {
    plugins = {
      {
        name = '@vue/typescript-plugin',
        location = vue_language_server_path,
        languages = { 'vue', }
      },
    },
  },
}

lspconfig.volar.setup {
  init_options = {
    vue = {
      hybridMode = false,
    },
    typescript = {
      tsdk = typescript_path,
    },
  },
}

lspconfig.gopls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  settings = {
    gopls = {
      completeUnimported = true,
      usePlaceholders = true,
      analyses = {
        unusedparams = true,
      },
    },
  },
}

lspconfig.pyright.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  settings = {
    python = {
      analysis = {
        typeCheckingMode = "off",
        extraPaths = {
          "global_helpers",
        },
      },
    },
  },
}

lspconfig.yamlls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  settings = {
    yaml = {
      schemas = {
        ["https://panther-community-us-east-1.s3.amazonaws.com/latest/logschema/schema.json"] = "internal/log_analysis/yamlschemas/schemas/**/*.yml",
        ["https://panther-community-us-east-1.s3.amazonaws.com/latest/logschema/schema-tests.json"] = "internal/log_analysis/yamlschemas/schemas/**/*_tests.yml",
        ["https://raw.githubusercontent.com/panther-labs/panther_analysis_tool/main/panther_analysis_tool/detection_schemas/analysis_config_schema.json"] = {
          "rules/**",
          "policies/**",
          "queries/**",
        },
      },
    },
  },
}
