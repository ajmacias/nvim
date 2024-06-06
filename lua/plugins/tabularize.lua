return {
    {
        "godlygeek/tabular",
        init = function()
            local opt = { noremap = true, silent = true }
            vim.keymap.set({ "n", "v" }, "<Leader>t&", ":Tabularize /&<cr>", opt)
            vim.keymap.set({ "n", "v" }, "<Leader>t&", ":Tabularize /&<cr>", opt)
            vim.keymap.set({ "n", "v" }, "<Leader>t=", ":Tabularize /=<cr>", opt)
            vim.keymap.set({ "n", "v" }, "<Leader>t=", ":Tabularize /=<cr>", opt)
            vim.keymap.set({ "n", "v" }, "<Leader>t=>", ":Tabularize /=><cr>", opt)
            vim.keymap.set({ "n", "v" }, "<Leader>t=>", ":Tabularize /=><cr>", opt)
            vim.keymap.set({ "n", "v" }, "<Leader>t:", ":Tabularize /:<cr>", opt)
            vim.keymap.set({ "n", "v" }, "<Leader>t:", ":Tabularize /:<cr>", opt)
            vim.keymap.set({ "n", "v" }, "<Leader>t::", ":Tabularize /:\zs<cr>", opt)
            vim.keymap.set({ "n", "v" }, "<Leader>t::", ":Tabularize /:\zs<cr>", opt)
            vim.keymap.set({ "n", "v" }, "<Leader>t,", ":Tabularize /,<cr>", opt)
            vim.keymap.set({ "n", "v" }, "<Leader>t,", ":Tabularize /,<cr>", opt)
            vim.keymap.set({ "n", "v" }, "<Leader>t,,", ":Tabularize /,\zs<cr>", opt)
            vim.keymap.set({ "n", "v" }, "<Leader>t,,", ":Tabularize /,\zs<cr>", opt)
            vim.keymap.set({ "n", "v" }, "<Leader>t<Bar>", ":Tabularize /<Bar><cr>", opt)
            vim.keymap.set({ "n", "v" }, "<Leader>t<Bar>", ":Tabularize /<Bar><cr>", opt)
            vim.keymap.set({ "n", "v" }, "<Leader>t\\", ":Tabularize /\\<cr>", opt)
            vim.keymap.set({ "n", "v" }, "<Leader>t\\", ":Tabularize /\\<cr>", opt)
            vim.keymap.set({ "n", "v" }, "<Leader>t\"", ":Tabularize /\"<cr>", opt)
            vim.keymap.set({ "n", "v" }, "<Leader>t\"", ":Tabularize /\"<cr>", opt)
            vim.keymap.set({ "n", "v" }, "<Leader>t#", ":Tabularize #\"<cr>", opt)
            vim.keymap.set({ "n", "v" }, "<Leader>t#", ":Tabularize #\"<cr>", opt)
        end,
    }
}
