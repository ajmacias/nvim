return {
  'echasnovski/mini.starter',
  version = false,
  event = 'VimEnter',
  config = function()
    local version = vim.version()
    local versionStr = string.format('v%d.%d.%d', version.major, version.minor, version.patch)

    local new_section = function(name, action, section)
      return { name = name, action = action, section = section }
    end

    local healthcheck = function()
      local checks = vim.health._complete()
      vim.ui.select(checks, { prompt = 'HealthCheck' }, function(check)
        if not check then
          return
        end
        vim.cmd('checkhealth ' .. check)
      end)
    end

    local logo = table.concat({
      '███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗',
      '████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║',
      '██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║',
      '██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║',
      '██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║',
      '╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝',
      versionStr .. ' - wip config',
    }, '\n')

    require('mini.starter').setup {
      evaluate_single = true,
      header = logo,
      footer = '',
      items = {
        new_section('Git Browser', ':Telescope git_files', 'Telescope'),
        new_section('File Browser', ':Telescope find_files', 'Telescope'),
        new_section('Recent Files', ':Telescope oldfiles', 'Telescope'),

        new_section('Oil', ':Oil', 'Files'),
        new_section('New file', 'ene | startinsert', 'Files'),

        new_section('Quit', ':qa', 'Neovim'),
        new_section('Health', healthcheck, 'Neovim'),
      },
    }
  end,
}
