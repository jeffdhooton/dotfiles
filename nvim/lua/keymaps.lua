-- General
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
vim.keymap.set('i', 'kj', '<esc>', { silent = true })
vim.keymap.set('i', 'jk', '<esc>', { silent = true })
vim.keymap.set('n', '<leader>ss', ':wa<CR>', { silent = true })
vim.keymap.set('n', 'y`]', 'y', { silent = true })
vim.keymap.set('n', 'L', 'A<esc>', { silent = true })
vim.keymap.set('n', 'H', 'I<esc>', { silent = true })

function SaveWithoutFormatting()
  vim.api.nvim_command('noautocmd w')
end

vim.api.nvim_create_user_command('SaveWithoutFmt', SaveWithoutFormatting, {})
vim.keymap.set('n', '<leader>W', ':lua SaveWithoutFormatting()<CR>', { noremap = true, silent = true })

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

-- Neotest --
--
-- Test single method
vim.keymap.set('n', '<leader>tm', ':lua require("neotest").run.run()<CR>',
  { noremap = true, desc = "Test single method", silent = true })
-- Test single file
vim.keymap.set('n', '<leader>tf', ':lua require("neotest").run.run(vim.fn.expand("%"))<CR>',
  { desc = "Test single file", silent = true, noremap = true })
-- Test whole suite
vim.keymap.set('n', '<leader>td', ':lua require("neotest").run.run({ suite = true })<CR>',
  { desc = "Test whole suite", silent = true, noremap = true })
-- STOP test
vim.keymap.set('n', '<leader>ts', ':lua require("neotest").run.stop()<CR>',
  { desc = "Stop test", silent = true, noremap = true })
-- Open testing output
vim.keymap.set('n', '<leader>to', ':lua require("neotest").output.open()<CR>',
  { desc = "Neotest output", silent = true, noremap = true })
-- Open testing output - ENTER
vim.keymap.set('n', '<leader>t0', ':lua require("neotest").output.open({ enter = true })<CR>',
  { desc = "Neotest output (enter)", silent = true, noremap = true })
-- Open testing summary
vim.keymap.set('n', '<leader>ti', ':lua require("neotest").summary.toggle()<CR>',
  { desc = "Neotest summary", silent = true, noremap = true })

return {}
