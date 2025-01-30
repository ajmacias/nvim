return {
  {
    'lewis6991/gitsigns.nvim',
    opts = {
      signs = {
        add = { text = '▎' },
        change = { text = '▎' },
        delete = { text = '➤' },
        topdelete = { text = '➤' },
        changedelete = { text = '▎' },
      },
      on_attach = function(bufnr)
        local gitsigns = require 'gitsigns'
        vim.keymap.set('n', '<leader>gp', gitsigns.preview_hunk, { buffer = bufnr })
      end,
      max_file_length = 10000,
    },
  },
}
