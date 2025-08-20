local opt = vim.opt

opt.backup = false
opt.swapfile = false
opt.colorcolumn = "120"
opt.relativenumber = true
opt.list = true
opt.listchars = "tab:➝ ,lead:·,space:·,trail:·,nbsp:+,eol:¬"
opt.scrolloff = 10
opt.signcolumn = "yes"
vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')
opt.expandtab = true
opt.shiftwidth = 2
opt.tabstop = 2
opt.softtabstop = 2
opt.autoindent = true
opt.smartindent = true
vim.opt.termguicolors = true
vim.opt.redrawtime = 10000

-- yank to clipboard
opt.clipboard = "unnamedplus"

-- feature toggles
vim.g.format_on_save = false
vim.g.copilot_enabled = false
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
    virtual_text = false
  }
)

-- language specific formatting
vim.api.nvim_create_autocmd("FileType", {
  pattern = "python",
  callback = function()
    vim.opt_local.shiftwidth = 4
    vim.opt_local.tabstop = 4
    vim.opt_local.softtabstop = 4
    vim.opt_local.expandtab = true
    -- Control continuation indents
    vim.opt_local.indentexpr = 'python3complete#GetIndent()'
    -- This controls how much to indent continuation lines
    vim.g.python_indent = {
      closed_paren_align_last_line = false,
      continue = 4,
      nested_paren = 4,
      open_paren = 4
    }
  end,
})
