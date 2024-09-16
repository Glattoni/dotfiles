-- Make sure to set `mapleader` before lazy so your mappings are correct
vim.g.mapleader = ' '

-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- skip backwards compatibility routines and speed up loading.
vim.g.skip_ts_context_commentstring_module = true

-- Disable the documentation mapping for conjure
vim.g['conjure#mapping#doc_word'] = false

local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- hide end of buffer
vim.opt.fillchars:append('eob: ')

require('settings')
require('lazy').setup('plugins')
