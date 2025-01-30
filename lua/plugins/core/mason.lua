local function locate(table, value)
  for i = 1, #table do
    if table[i] == value then
      return true
    end
  end
  return false
end

-- LSP to install
local languages = require('config.tools').lspservers
local lsp_to_install = {}

for _, server in ipairs(languages) do
  table.insert(lsp_to_install, server.name)
end

-- tools for mason
local tools = {
  require('config.tools').tools,
}
local tools_to_install = {}

for _, entry in ipairs(tools) do
  for _, tool in pairs(entry) do
    -- Verifica si `tool` es una lista o una tabla con claves específicas.
    if type(tool) == 'table' and tool.name and tool.type ~= 'code_actions' then
      -- Caso para `tools` (diccionario con `name`).
      local n = tool.name:gsub('_', '-')
      if not locate(tools_to_install, n) then
        table.insert(tools_to_install, n)
      end
    elseif type(tool) == 'table' then
      -- Caso para `formatters` o `linters` (listas de herramientas).
      for _, toolname in ipairs(tool) do
        local n = toolname:gsub('_', '-')
        if not locate(tools_to_install, n) then
          table.insert(tools_to_install, n)
        end
      end
    end
  end
end

-- ensure lua_ls is installed
table.insert(lsp_to_install, 'lua_ls')

return {
  {
    'williamboman/mason.nvim',
    opts = {
      ui = {
        border = 'rounded',
        width = 0.8,
        height = 0.8,
      },
    },
  },
  {
    'williamboman/mason-lspconfig.nvim',
    opts = {
      ensure_installed = lsp_to_install,
    },
  },
  {
    'WhoIsSethDaniel/mason-tool-installer.nvim',
    dependencies = {
      'williamboman/mason.nvim',
    },
    opts = {
      ensure_installed = tools_to_install,
    },
  },
}
