-- PHP
--
-- Imports single class
vim.keymap.set('n', '<leader>oi', ':PhpactorImportClass<CR>', { desc = "PHP [I]mport", silent = true, noremap = true })

-- Imports all missing classes
vim.keymap.set('n', '<leader>oa', ':PhpactorImportMissingClasses<CR>',
  { desc = "PHP Import [A]ll Missing Classes", silent = true, noremap = true })

-- Implements contracts
vim.keymap.set('n', '<leader>oc', ':PhpactorImplementContracts<CR>',
  { desc = "PHP Implement [C]ontracts", silent = true, noremap = true })

-- Fix namespace or class name
vim.keymap.set('n', '<leader>ot', ':PhpactorTransform<CR>',
  { desc = "PHP [T]ransform", silent = true, noremap = true })

return {}
