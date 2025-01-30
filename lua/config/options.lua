-- Line numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- tabs & indentation
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = true
vim.opt.autoindent = true

-- Line wrapping
vim.opt.wrap = false

-- search settings
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- cursor line
vim.opt.cursorline = true
vim.opt.cursorlineopt = 'number'

-- appearance
vim.opt.termguicolors = true
vim.opt.signcolumn = 'yes'
vim.opt.scrolloff = 10
vim.opt.showmode = false
vim.opt.cmdheight = 0
vim.opt.conceallevel = 0

-- system clipboard
vim.opt.clipboard = 'unnamedplus'

-- split windows
vim.opt.splitright = true
vim.opt.splitbelow = true

-- disable mouse
vim.opt.mouse = ''

-- backup
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.writebackup = false

-- folding
vim.opt.foldlevel = 20
vim.opt.foldmethod = 'expr'
vim.opt.foldexpr = 'nvim_treesitter#foldexp()' -- use treesitter folds

-- custom global vars
vim.g.cmp_toggle_flag = true -- initialize global flag for toggle cmp completion
