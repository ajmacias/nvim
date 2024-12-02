local options = {
  -- ui
  number         = true,
  relativenumber = true,
  termguicolors  = true,
  cursorline     = true,
  wrap           = false,
  signcolumn     = "yes",

  -- system clipboard
  clipboard      = "unnamedplus",

  -- backup
  swapfile       = false,
  backup         = false,
  writebackup    = false,

  -- tabs,
  expandtab      = true,
  shiftwidth     = 4,
  tabstop        = 4,
  softtabstop    = 4,

  -- other things...
  shortmess      = "filnxtToOFWIcC",
  conceallevel   = 0,
}

-- cycle through table and set options
for key, value in pairs(options) do
  vim.opt[key] = value
end

-- <leader> key before lazy.nvim
vim.g.mapleader      = ","
vim.g.localmapleader = ","
