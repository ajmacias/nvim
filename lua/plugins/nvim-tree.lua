return {
    {
        "nvim-tree/nvim-tree.lua",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        config = function()
            local keymap = vim.keymap

            keymap.set("n", "<F12>", ":NvimTreeToggle<cr>", { desc = "Toggle file explorer (legacy)" })
            keymap.set("i", "<F12>", "<esc>:NvimTreeToggle<cr>", { desc = "Toggle file explorer (legacy)" })
            keymap.set("n", "<leader>ee", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle file explorer" })
            keymap.set("n", "<leader>ef", "<cmd>NvimTreeFindFileToggle<CR>",
                { desc = "Toggle file explorer on current file" })
            keymap.set("n", "<leader>ec", "<cmd>NvimTreeCollapse<CR>", { desc = "Collapse file explorer" })
            keymap.set("n", "<leader>er", "<cmd>NvimTreeRefresh<CR>", { desc = "Refresh file explorer" })

            require("nvim-tree").setup()
        end,
    },
}
