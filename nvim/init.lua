-- Set <space> as the leader key
-- See `:help mapleader`
--  NOTE: Must happen before plugins are required (otherwise wrong leader will be used)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Install package manager
--    https://github.com/folke/lazy.nvim
--    `:help lazy.nvim.txt` for more info
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system {
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable',
    lazypath,
  }
end

vim.opt.rtp:prepend(vim.fn.stdpath('config') .. '/lua')

vim.opt.rtp:prepend(lazypath)
vim.cmd('syntax enable');

require('settings')
require('options')
require('keymaps')
require('plugins')
require('mason').setup()
require('neodev').setup()
require('telescope_config')
require('treesitter_config')
require('lsp_config')
require('cmp_config')
-- require('luasnip')
