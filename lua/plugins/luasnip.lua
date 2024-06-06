return {
    {
        "L3MON4D3/LuaSnip",
        config = function()
            local ls = require("luasnip")
            local types = require("luasnip.util.types")

            ls.config.set_config {
                history = true,
                updateevents = "TextChanged,TextChangedI",
                enable_autosnippets = true,

                ext_opts = {
                    [types.choiceNode] = {
                        active = {
                            virt_text = { { "<- Choice", "Error" } },
                        },
                    },
                },
            }

            -- load
            --require("luasnip.loaders.from_snipmate").lazy_load()
            require("luasnip.loaders.from_vscode").load({ paths = "~/.config/nvim/snippets" })

            -- expansion key
            vim.keymap.set({ "i", "s" }, "<c-k>", function()
                if ls.expand_or_jumpable() then
                    ls.expand_or_jump()
                end
            end, { silent = true })

            -- jump key
            vim.keymap.set({ "i", "s" }, "<c-j>", function()
                if ls.jumpable(-1) then
                    ls.jump(-1)
                end
            end, { silent = true })

            -- selecting within a list of options
            vim.keymap.set("i", "<c-l>", function()
                if ls.choice_active() then
                    ls.change_choice(1)
                end
            end)
        end,
    }
}
