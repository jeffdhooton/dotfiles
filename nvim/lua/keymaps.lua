-- General
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
vim.keymap.set('i', 'kj', '<esc>', { silent = true })
vim.keymap.set('i', 'jk', '<esc>', { silent = true })
vim.keymap.set('n', '<leader>tt', ':BufOnly<CR>', { silent = true })
vim.keymap.set('n', '<leader>ss', ':wa<CR>', { silent = true })
vim.keymap.set('n', 'y`]', 'y', { silent = true })
vim.keymap.set('n', 'L', 'A<esc>', { silent = true })
vim.keymap.set('n', 'H', 'I<esc>', { silent = true })

-- Copilot
vim.g.copilot_assume_mapped = true
vim.g.copilot_tab_fallback = ""
vim.g.copilot_no_tab_map = true
vim.g.copilot_filetypes = {
  ["*"] = false,
  ["lua"] = false,
  ["javascript"] = true,
  ["javascriptreact"] = true,
  ["typescript"] = true,
  ["typescriptreact"] = true,
  ["vue"] = true,
  ["go"] = true,
  ["c"] = true,
  ["c++"] = true,
  ["c#"] = true,
  ["rust"] = true,
  ["python"] = true,
}
vim.api.nvim_set_keymap("i", "<C-J>", 'copilot#Accept("<CR>")', { silent = true, expr = true })

vim.keymap.set('n', '<leader>m', '%', { silent = true })
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})

-- Diagnostics
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = "Go to previous diagnostic message" })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = "Go to next diagnostic message" })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = "Open floating diagnostic message" })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = "Open diagnostics list" })


return {}
