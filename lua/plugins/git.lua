return {
    {
        "lewis6991/gitsigns.nvim",
        dependencies = {
            "tpope/vim-fugitive",
        },
        opts = {
            signs = {
                add = { text = '▎' },
                change = { text = '▎' },
                delete = { text = '➤' },
                topdelete = { text = '➤' },
                changedelete = { text = '▎' },
            },
            on_attach = function(bufnr)
                local gitsigns = require "gitsigns"
                vim.keymap.set("n", "<leader>gp", gitsigns.preview_hunk, { buffer = bufnr })
                -- vim.keymap.set("n", "<leader>hs", gitsigns.stage_hunk, { buffer = bufnr })
                -- vim.keymap.set("n", "<leader>hu", gitsigns.undo_stage_hunk, { buffer = bufnr })
                -- vim.keymap.set("n", "<leader>hr", gitsigns.reset_hunk, { buffer = bufnr })
                -- vim.keymap.set("n", "<leader>hj", gitsigns.next_hunk, { buffer = bufnr })
                -- vim.keymap.set("n", "<leader>hk", gitsigns.prev_hunk, { buffer = bufnr })

                -- local opt = { noremap = true, silent = true }
                -- vim.keymap.set("n", "<Leader>gs", ":Git<CR>", opt)
                -- vim.keymap.set("n", "<Leader>gl", ":Git log<CR>", opt)
                -- vim.keymap.set("n", "<Leader>ga", ":Git add .<CR>", opt)
                -- vim.keymap.set("n", "<Leader>gc", ":Git commit<CR>", opt)
            end,
            max_file_length = 10000,
        },
    },
}
