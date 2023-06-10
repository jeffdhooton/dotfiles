vim.cmd([[autocmd BufWritePre <buffer> lua vim.lsp.buf.format() ]])
vim.cmd([[autocmd BufWritePre * lua vim.lsp.buf.format()]])
vim.cmd([[
  set tabstop=2
  set softtabstop=2
  set shiftwidth=2
  set expandtab
]])

vim.api.nvim_exec([[
  autocmd FileType * setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab
]], false)

return {}
