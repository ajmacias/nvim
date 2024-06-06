return {
    {
        "nvimtools/none-ls.nvim",
        config = function()
            local null_ls = require("null-ls")

            null_ls.setup({
                sources = {
                    null_ls.builtins.diagnostics.twigcs,
                    null_ls.builtins.diagnostics.phpcs.with {
                        method = null_ls.methods.DIAGNOSTIC_ON_SAVE,
                        condition = function(utils)
                            return utils.root_has_file ".phpcs.xml"
                        end,
                    },
                    null_ls.builtins.formatting.pint.with {
                        method = null_ls.methods.DIAGNOSTIC_ON_SAVE,
                        condition = function(utils)
                            return utils.root_has_file "artisan"
                        end,
                    },
                    null_ls.builtins.formatting.phpcsfixer.with {
                        condition = function(utils)
                            return not utils.root_has_file "artisan"
                        end,
                    },
                },
            })
        end
    }
}
