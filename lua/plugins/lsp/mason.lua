return {
  {
    "williamboman/mason.nvim",
    opts = {
      log_level = vim.log.levels.INFO
    },
    config = function()
      require('mason').setup()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    requires = {
      "neovim/nvim-lspconfig",
      "williamboman/mason.nvim",
    },
    config = function()
      local __lspServers = require("config.plugins.tools").lspservers
      local ensure_installed = {}

      for _, server in ipairs(__lspServers) do
        table.insert(ensure_installed, server.name)
      end

      require("mason-lspconfig").setup({
        ensure_installed = ensure_installed,
      })
    end,
  },
  {
    'WhoIsSethDaniel/mason-tool-installer.nvim',
    requires = {
      'williamboman/mason.nvim',
    },
    config = function()
      local function locate(table, value)
        for i = 1, #table do
          if table[i] == value then
            return true
          end
        end
        return false
      end

      local ensure_installed = {}
      local __toInstall = {
        require("config.plugins.tools").linters,
        require("config.plugins.tools").tools,
      }

      for _, entry in ipairs(__toInstall) do
        for _, tool in pairs(entry) do
          -- Verifica si `tool` es una lista o una tabla con claves específicas.
          if type(tool) == "table" and tool.name and tool.type ~= "code_actions" then
            -- Caso para `tools` (diccionario con `name`).
            local n = tool.name:gsub("_", "-")
            if not locate(ensure_installed, n) then
              table.insert(ensure_installed, n)
            end
          elseif type(tool) == "table" then
            -- Caso para `formatters` o `linters` (listas de herramientas).
            for _, toolname in ipairs(tool) do
              local n = toolname:gsub("_", "-")
              if not locate(ensure_installed, n) then
                table.insert(ensure_installed, n)
              end
            end
          end
        end
      end

      -- vim.print(vim.inspect(ensure_installed))

      require('mason-tool-installer').setup({
        ensure_installed = ensure_installed
      })
    end,
  }
}
