local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  spec = {
    -- path to plugins
    { import = "plugins.core" },
    { import = "plugins.lsp" },
    { import = "plugins.tools" },
    { import = "plugins.ui" },
  },
  install = {
    colorscheme = { "catppuccin", "habamax" }
  },
  ui = {
    border = "rounded",
  },
  checker = {
    enabled = true,
    notify = false,
  },
  change_detection = {
    notify = false,
  },
  performance = {
    rtp = {
      disabled_plugins = {
        "gzip",
        "matchit",
        "matchparent",
        "netrwPlugin",
        "tohtml",
        "tutor",
        "zipPlugin",
      },
    },
  },
})
