local M = {}

M.lspservers = {
  {
    name = "ts_ls",
    extraOptions = {
      handlers = {
        ["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { silent = true }),
      }
    }
  },
  {
    name = "emmet_ls",
    extraOptions = {
      filetypes = { "css", "html", "javascriptreact", "less", "sass", "scss", "svelte", "typescriptreact", "vue", "htmlangular", "twig" },
    },
  },
  {
    name = "lua_ls",
    extraOptions = {
      settings = {
        Lua = {
          runtime = { version = "LuaJIT" },
          diagnostics = { globals = { "vim" } },
          telemetry = { enable = false },
          workspace = {
            checkThirdParty = false,
            -- library = vim.api.nvim_get_runtime_file("", true),
          },
        },
      },
    }
  },
  { name = "phpactor" },
  {
    name = "pylsp",
    extraOptions = {
      settings = {
        pylsp = {
          plugins = {
            pycodestyle = {
              maxLineLength = 100,
            },
          },
        },
      },
    },
  },
}

M.linters = {
  html = { "htmlhint" },
  twig = { "djlint" },
}

M.tools = {
  { name = "gitsigns",     type = "code_actions", },

  { name = "djlint",       type = "formatting",   condition = ".djlintrc",          extra_filetypes = { "twig" } },
  { name = "phpcbf",       type = "formatting",   condition = ".phpcs.xml" },
  { name = "prettierd",    type = "formatting", },

  { name = "djlint",       type = "diagnostics",  condition = ".djlintrc",          extra_filetypes = { "twig" } },
  { name = "phpcs",        type = "diagnostics",  condition = ".phpcs.xml" },
  { name = "twigcs",       type = "diagnostics", },
}


M.treesitter = {
  { name = "bash" },
  { name = "css" },
  { name = "html" },
  { name = "javascript" },
  { name = "json" },
  { name = "lua" },
  { name = "luadoc" },
  { name = "markdown" },
  { name = "markdown_inline" },
  { name = "php" },
  { name = "phpdoc" },
  { name = "sql" },
  { name = "twig" },
  { name = "vim" },
  { name = "vimdoc" },
  { name = "yaml" },
}

return M
