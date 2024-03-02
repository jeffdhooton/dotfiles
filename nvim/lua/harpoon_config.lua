vim.keymap.set('n', '<leader>ha', require('harpoon.mark').add_file, { desc = '[H]arpoon [A]dd file' })
vim.keymap.set('n', '<leader>hf', require('harpoon.ui').toggle_quick_menu, { desc = '[H]arpoon [F] toggle quick menu' })

return {}
