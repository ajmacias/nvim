return {
  'nvim-telescope/telescope.nvim',
  dependencies = {
    { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
    'nvim-telescope/telescope-ui-select.nvim',
  },
  config = function()
    require('telescope').setup {
      defaults = {
        file_ignore_patterns = { '.git', 'vendor' },
        prompt_prefix = '🔍 ',
        layout_strategy = 'vertical',
        layout_config = {
          mirror = true,
          preview_cutoff = 20,
          prompt_position = 'top',
        },
      },
      extensions = {
        fzf = {},
        ['ui-select'] = {
          require('telescope.themes').get_dropdown {},
        },
      },
    }

    -- extensions
    pcall(require('telescope').load_extension, 'fzf')
    pcall(require('telescope').load_extension, 'ui-select')

    -- keybinding
    local builtin = require 'telescope.builtin'

    vim.keymap.set('n', '<leader>pp', function()
      local opts = { show_untracked = true }
      local ok = pcall(builtin.git_files, opts)
      if not ok then
        builtin.find_files(opts)
      end
    end, { desc = 'Telescope: Open project files' })

    vim.keymap.set('n', '<leader>pk', builtin.keymaps, { desc = 'Telescope: keymaps' })
    vim.keymap.set('n', '<leader>pg', builtin.live_grep, { desc = 'Telescope: Live grep' })
    vim.keymap.set('n', '<leader>pb', builtin.buffers, { desc = 'Telescope: Active buffers' })
    vim.keymap.set('n', '<leader>ps', builtin.git_status, { desc = 'Telescope: Git status' })
  end,
}
