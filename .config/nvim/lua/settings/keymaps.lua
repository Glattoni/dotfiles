local map = require('utils').map

local opts = { noremap = true, silent = true }

-- Save file
map('n', '<C-s>', ':w<CR>', opts)
map('i', '<C-s>', '<esc>:w<CR>', opts)

-- Bufferline
map('n', '<Tab>', ':BufferLineCycleNext<CR>', opts)
map('n', '<S-Tab>', ':BufferLineCyclePrev<CR>', opts)
map('n', '<Leader>x', ':BufferLinePickClose<CR>', opts)
map('n', '<Leader>pb', ':BufferLineTogglePin<CR>', opts)
map('n', '<Leader>bmn', ':BufferLineMoveNext<CR>', opts)
map('n', '<Leader>bmp', ':BufferLineMovePrev<CR>', opts)

-- File explorer
map('n', '<Leader>e', ':NvimTreeToggle<CR>', opts)

-- Telescope
map('n', '<Leader>ff', ':Telescope find_files<CR>', opts)
map('n', '<Leader>lg', ':Telescope live_grep<CR>', opts)
map('n', '<Leader>gs', ':Telescope grep_string<CR>', opts)

map('n', '<Leader>fb', ':Telescope buffers<CR>', opts)
map('n', '<Leader>gb', ':Telescope git_branches<CR>', opts)
map('n', '<Leader>fg', ':Telescope current_buffer_fuzzy_find<CR>', opts)
map('n', '<Leader>ht', ':Telescope help_tags<CR>', opts)
map('n', 'gr', ':Telescope lsp_references<CR>', opts)

-- Git signs
map('n', '<Leader>bl', ':Gitsigns blame_line<CR>', opts)
map('n', '<Leader>ph', ':Gitsigns preview_hunk<CR>', opts)

-- Easier navigation between windows
map('n', '<C-h>', '<C-w>h', opts)
map('n', '<C-j>', '<C-w>j', opts)
map('n', '<C-k>', '<C-w>k', opts)
map('n', '<C-l>', '<C-w>l', opts)

-- Run jest
map('n', '<Leader>jr', ':lua require("jester").run()<CR>', opts)
map('n', '<Leader>jrf', ':lua require("jester").run_file()<CR>', opts)
map('n', '<Leader>jrl', ':lua require("jester").run_last()<CR>', opts)
