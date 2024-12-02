return {
  "nvimtools/none-ls.nvim",
  config = function()
    local null_ls = require("null-ls")

    local __lspTools = require("config.plugins.tools").tools
    local __sources = {}

    for _, tool in ipairs(__lspTools) do
      -- eliminamos los guiones del nombre
      local tool_name = tool.name:gsub("-", "")

      local builtin
      builtin = null_ls.builtins[tool.type][tool_name].with {
        condition = function(utils)
          if not tool.condition then return true end
          return tool.condition and utils.root_has_file(tool.condition)
        end,
        extra_filetypes = tool.extra_filetypes,
        extra_args = tool.extra_args,
      }

      if builtin then
        table.insert(__sources, builtin)
      end
    end

    null_ls.setup({
      sources = __sources,
    })
  end
}
