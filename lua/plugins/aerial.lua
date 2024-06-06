return {
    {
        'stevearc/aerial.nvim',
        opts = {},
        dependencies = {
            "nvim-treesitter/nvim-treesitter",
            "nvim-tree/nvim-web-devicons"
        },
        config = function()
            require("aerial").setup({
                layout = {
                    max_width = { 60, 0.3 },
                    width = nil,
                    min_width = 20,
                },

                on_attach = function(bufnr)
                    -- Jump forwards/backwards with "{" and "}"
                    vim.keymap.set("n", "{", "<cmd>AerialPrev<CR>", { buffer = bufnr })
                    vim.keymap.set("n", "}", "<cmd>AerialNext<CR>", { buffer = bufnr })
                end,
            })

            vim.keymap.set("n", "<F3>", ":AerialToggle!<cr>", { silent = true })
            vim.keymap.set("i", "<F3>", "<esc>:AerialToggle!<cr>", { silent = true, noremap = false })
        end,
    },
}
