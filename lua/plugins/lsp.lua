return {
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            "williamboman/mason.nvim",
            "williamboman/mason-lspconfig.nvim",
        },
        config = function()
            local lspconfig = require("lspconfig")
            local lsp_capabilities = require("cmp_nvim_lsp").default_capabilities()
            local lsp_ui = require('lspconfig.ui.windows')

            -- Colocamos el borde de la ventana
            lsp_ui.default_options.border = 'rounded'

            local function lsp_attach(client, bufnr)
                -- mappings
                local keymap = vim.keymap
                local opts = { buffer = bufnr, silent = true }

                -- Información del símbolo de debajo del cursor
                opts.desc = "LSP: Show documentation for what is under cursor"
                keymap.set('n', '<F1>', vim.lsp.buf.hover, opts)

                -- Ir a la definición
                opts.desc = "LSP: Go to definition"
                keymap.set('n', 'gd', vim.lsp.buf.definition, opts)

                -- Ir a la declaración
                opts.desc = "LSP: Go to declaration"
                keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)

                -- Implementación
                opts.desc = "LSP: Go to implementation"
                keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)

                -- Ir a la definición del tipo
                opts.desc = "Show LSP type definitions"
                keymap.set('n', 'go', vim.lsp.buf.type_definition, opts)

                -- Mostrar todas las referencias
                opts.desc = "Show LSP references"
                keymap.set('n', 'gr', vim.lsp.buf.references, opts)

                -- Ayuda
                opts.desc = "LSP: Show signature_help"
                keymap.set('n', 'gs', vim.lsp.buf.signature_help, opts)

                -- Renombrar todas las referencias
                opts.desc = "LSP: Smart rename"
                keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)

                -- Selecciona code action
                opts.desc = "LSP: Show available code actions"
                keymap.set('n', '<space>ca', vim.lsp.buf.code_action, opts)

                -- format
                opts.desc = "LSP: Code format"
                vim.keymap.set('n', '<space>f', function()
                    return vim.lsp.buf.format { async = true }
                end, opts)

                -- diagnostico
                keymap.set('n', "<space>e", vim.diagnostic.open_float, opts)
                keymap.set('n', "[w", vim.diagnostic.goto_prev, opts)
                keymap.set('n', "]w", vim.diagnostic.goto_next, opts)
                keymap.set('n', "<space>q", vim.diagnostic.setloclist, opts)


                -- autocomplete
                vim.bo[bufnr].omnifunc = 'v:lua.vim.lsp.omnifunc'
            end

            -- Prevenimos multiples instancias de servidor LSP
            if vim.g.lsp_setup_ready == nil then
                vim.g.lsp_setup_ready = true

                -- configuración de los servidores LSP
                lspconfig.lua_ls.setup({
                    capabilities = lsp_capabilities,
                    on_attach = lsp_attach,
                    settings = {
                        Lua = {
                            runtime = {
                                version = "LuaJIT",
                            },
                            diagnostics = {
                                globals = { "vim" },
                            },
                            workspace = {
                                library = vim.api.nvim_get_runtime_file("", true),
                                checkThirdParty = false,
                            },
                            telemetry = {
                                enable = false,
                            },
                            hint = {
                                enable = true,
                            },
                            completion = {
                                callSnippet = "Replace",
                            },
                        }
                    },
                })

                lspconfig.tsserver.setup({
                    capabilities = lsp_capabilities,
                    on_attach = lsp_attach,
                    settings = {
                        typescript = {
                            inlayHints = {
                                includeInlayParameterNameHints = "all",
                                includeInlayParameterNameHintsWhenArgumentMatchesName = false,
                                includeInlayFunctionParameterTypeHints = true,
                                includeInlayVariableTypeHints = true,
                                includeInlayPropertyDeclarationTypeHints = true,
                                includeInlayFunctionLikeReturnTypeHints = true,
                                includeInlayEnumMemberValueHints = true,
                            },
                        },
                        javascript = {
                            inlayHints = {
                                includeInlayParameterNameHints = "all",
                                includeInlayParameterNameHintsWhenArgumentMatchesName = false,
                                includeInlayFunctionParameterTypeHints = true,
                                includeInlayVariableTypeHints = true,
                                includeInlayPropertyDeclarationTypeHints = true,
                                includeInlayFunctionLikeReturnTypeHints = true,
                                includeInlayEnumMemberValueHints = true,
                            },
                        },
                    },
                })

                lspconfig.phpactor.setup({
                    capabilities = lsp_capabilities,
                    on_attach = lsp_attach,
                    -- init_options = {
                    --     [ "php_code_sniffer.enabled" ] = true,
                    --     [ "php_code_sniffer.bin" ] = "~/.local/share/nvim/mason/bin/phpcs",
                    -- },
                    -- handlers = {
                    --     ["textDocument/publishDiagnostics"] = function(err, result, ...)
                    --         if vim.endswith(result.uri, "Test.php") then
                    --             result.diagnostics = vim.tbl_filter(function(diagnostic)
                    --                 return not vim.startswith(diagnostic.message, 'Namespace should probably be "Tests')
                    --             end, result.diagnostics)
                    --         end
                    --         vim.lsp.diagnostic.on_publish_diagnostics(err, result, ...)
                    --     end
                    -- }
                })

                lspconfig.emmet_ls.setup({
                    capabilities = lsp_capabilities,
                    on_attach = lsp_attach,
                })
            end
        end,
    }
}
