return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
    },
    config = function()
      require('lspconfig.ui.windows').default_options.border = 'single'

      local __lspServers = require("config.plugins.tools").lspservers

      -- capabilities para cada servidor LSP
      local __lspCapabilities = function()
        local capabilities = vim.lsp.protocol.make_client_capabilities()

        capabilities = vim.tbl_deep_extend("force", capabilities, require("cmp_nvim_lsp").default_capabilities())

        return capabilities
      end

      -- configuración común para cada servidor LSP
      local __setup = {
        capabilities = __lspCapabilities(),
        on_attach = function(_, bufnr)
          vim.bo[bufnr].omnifunc = 'v:lua.vim.lsp.omnifunc'
          local keymap = vim.keymap
          local opts = { buffer = bufnr, silent = true }

          keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
          keymap.set("n", "gd", vim.lsp.buf.definition, opts)
          keymap.set("n", "K", vim.lsp.buf.hover, opts)
          keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
          keymap.set("i", "<C-k>", vim.lsp.buf.signature_help, opts)
          keymap.set({ "v", "n" }, "<space>ca", vim.lsp.buf.code_action, opts)
          keymap.set("n", "<space>D", vim.lsp.buf.type_definition, opts)
          keymap.set("n", "<space>rn", vim.lsp.buf.rename, opts)
          keymap.set("n", "gr", vim.lsp.buf.references, opts)

          keymap.set("n", "<space>f", function()
            vim.lsp.buf.format({ async = true })
          end)
        end,
      }

      -- keymaps para LSP
      vim.keymap.set("n", "<space>e", vim.diagnostic.open_float)
      vim.keymap.set("n", "[d", vim.diagnostic.goto_prev)
      vim.keymap.set("n", "]d", vim.diagnostic.goto_next)
      vim.keymap.set("n", "<space>q", vim.diagnostic.setloclist)

      -- configuracion de cada servidor LSP
      for _, server in ipairs(__lspServers) do
        if type(server) == "string" then
          require("lspconfig")[server].setup(__setup)
        else
          local options = server.extraOptions

          if options == nil then
            options = __setup
          else
            options = vim.tbl_extend("keep", options, __setup)
          end

          require("lspconfig")[server.name].setup(options)
        end
      end

      -- diagnostico
      local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
      for type, icon in pairs(signs) do
        local hl = "DiagnosticSign" .. type
        vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
      end

      -- undercurl
      vim.cmd.highlight('DiagnosticUnderlineError guisp=#ff0000 gui=undercurl')

      -- ventanas de diagnostico
      vim.diagnostic.config({
        underline = true,
        virtual_text = true,
        float = {
          border = "rounded"
        },
      })
    end,
  }
}
