-- leader
vim.g.mapleader = ','
vim.g.maplocalleader = ','

-- source current file
vim.keymap.set('n', '<leader>so', ':source %<CR>', {})

-- window management
vim.keymap.set('n', '<leader>sv', '<C-w>v', { desc = 'Split window vertically' })
vim.keymap.set('n', '<leader>sh', '<C-w>s', { desc = 'Split window horizontally' })
vim.keymap.set('n', '<leader>se', '<C-w>=', { desc = 'Make splits equal size' })
vim.keymap.set('n', '<leader>sx', '<cmd>close<CR>', { desc = 'Close current split' })
vim.keymap.set('n', '<tab>', '<c-w><c-w>', { desc = ' Window switch with TAB' })

-- ignore some things...
vim.keymap.set('n', 'Q', '<silent>', {})
vim.keymap.set('n', 'q:', '<silent>', {})
vim.keymap.set('n', 'K', '<silent>', {})

-- fold
vim.keymap.set('i', '<F2>', '<C-O>za', { desc = 'Toggle fold' })
vim.keymap.set('n', '<F2>', 'za', { desc = 'Toggle fold' })
vim.keymap.set('v', '<F2>', 'zf', { desc = 'Toggle fold' })

-- search
vim.keymap.set('n', '<leader>n', ':nohls<CR>', { desc = 'Clear search highlights' })
vim.keymap.set('n', 'n', 'nzzzv', { desc = 'Goes to the next result on the seach and put the cursor in the middle' })
vim.keymap.set('n', 'N', 'Nzzzv', { desc = 'Goes to the prev result on the seach and put the cursor in the middle' })

-- bufferes
vim.keymap.set('n', '<leader>l', ':bnext<cr>', { desc = 'Switch to next buffer' })
vim.keymap.set('n', '<leader>h', ':bprevious<cr>', { desc = 'Switch to previous buffer' })
vim.keymap.set('n', '<leader>x', ':bp<cr>:bd #<cr>', { desc = 'Close current buffer' })

-- indent file
vim.keymap.set('n', '<leader>fef', 'ggVG=', { desc = 'Indent entire file' })

-- toggle completion
vim.keymap.set('n', '<leader>tc', ":lua require('config.tools').toggle_completion()<CR>", {})
