return {
  'stevearc/conform.nvim',
  event = { 'BufWritePre' },
  cmd = { 'ConformInfo' },
  keys = {
    {
      '<space>f',
      function()
        require('conform').format { async = true, lsp_format = 'fallback' }
      end,
      mode = '',
      desc = '[F]ormat buffer',
    },
  },
  config = function()
    local util = require 'conform.util'

    require('conform').setup {
      formatters_by_ft = {
        php = { 'php-cs-fixer', 'php-cs-fixer-generic', stop_after_first = true },
        lua = { 'stylua' },
      },
      formatters = {
        ['php-cs-fixer'] = {
          command = 'php-cs-fixer',
          cwd = util.root_file { '.php-cs-fixer.php' },
          require_cwd = true,
          args = {
            'fix',
            '$FILENAME',
            '--config=.php-cs-fixer.php',
          },
          stdin = false,
        },
        ['php-cs-fixer-generic'] = {
          command = 'php-cs-fixer',
          args = {
            'fix',
            '$FILENAME',
            '--rules=@PSR12',
          },
          stdin = false,
        },
      },
      notify_on_error = false,
      format_on_save = {
        timeout_ms = 500,
        lsp_format = 'fallback',
      },
    }
  end,
}
