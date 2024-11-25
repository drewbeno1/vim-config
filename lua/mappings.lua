local map = vim.keymap.set

-- LSP
map("n", "[d", vim.diagnostic.goto_prev, { desc = "LSP Go to previous diagnostic" })
map("n", "]d", vim.diagnostic.goto_next, { desc = "LSP Go to next diagnostic" })
map("n", "E", vim.diagnostic.open_float, { desc = "LSP Open diagnostics" })

-- Oil
map("n", "!", "<CMD>Oil<CR>", { desc = "Open parent directory" })

-- nvim-tree
map("n", "<C-n>", "<cmd>NvimTreeToggle<CR>", { desc = "NvimTree Toggle window" })

-- Telescope
map("n", "<leader>fw", "<cmd>Telescope live_grep<CR>", { desc = "Telescope Live grep" })
map("n", "<leader>fb", "<cmd>Telescope buffers<CR>", { desc = "Telescope Find buffers" })
map("n", "<leader>cm", "<cmd>Telescope git_commits<CR>", { desc = "Telescope Git commits" })
map("n", "<leader>gt", "<cmd>Telescope git_status<CR>", { desc = "Telescope Git status" })
map("n", "<leader>pt", "<cmd>Telescope terms<CR>", { desc = "Telescope Pick hidden term" })
map("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Telescope Find files" })
map("n", "<leader>fr", "<cmd>Telescope oldfiles<cr>", { desc = "Telescope Find recent files" })
map(
  "n",
  "<leader>fa",
  "<cmd>Telescope find_files follow=true no_ignore=true hidden=true<CR>",
  { desc = "Telescope Find all files" }
)

-- General
map('n', '<leader>r', '<C-^>', { desc = 'Switch to previous buffer' })
map("i", "<C-h>", "<Left>", { desc = "General Move Left" })
map("i", "<C-l>", "<Right>", { desc = "General Move Right" })
map("i", "<C-j>", "<Down>", { desc = "General Move Down" })
map("i", "<C-k>", "<Up>", { desc = "General Move Up" })
map("n", "<C-h>", "<C-w>h", { desc = "General Switch Window left" })
map("n", "<C-l>", "<C-w>l", { desc = "General Switch Window right" })
map("n", "<C-j>", "<C-w>j", { desc = "General Switch Window down" })
map("n", "<C-k>", "<C-w>k", { desc = "General Switch Window up" })
map("n", "<S-u>", "<C-r>", { desc = "General Redo" })
map("n", "<C-c>", "<cmd>%y+<CR>", { desc = "General File Copy whole" })
map("n", "<leader>v", "<cmd> vsplit <CR>", { desc = "General Vertical split" })
map("n", "<leader>lu", "<cmd> Lazy update <CR>", { desc = "General Update Lazy plugins" })
map("n", "<leader>pr", "<cmd> MarkdownPreviewToggle <CR>", { desc = "General Preview Markdown file" })

-- Copilot
map("n", "<leader>cp", function()
  if vim.g.copilot_enabled then
    vim.cmd "Copilot disable"
    print "Copilot disabled"
  else
    if not vim.g.copilot_initialized then
      require("copilot").setup()
      require("copilot_cmp").setup()
      vim.g.copilot_initialized = true
    end
    vim.cmd "Copilot enable"
    print "Copilot enabled"
  end
  vim.g.copilot_enabled = not vim.g.copilot_enabled
end, { desc = "General Toggle Copilot" })
