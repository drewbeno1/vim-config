local function go_home()
  vim.cmd('NvimTreeOpen')
  vim.cmd('wincmd p')
  vim.cmd('q')
  vim.cmd('NvimTreeCollapse')
end

return { go_home = go_home }
