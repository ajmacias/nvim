return {
    {
        "akinsho/bufferline.nvim",
        version="*", -- la última estable (tag)
        dependencies = {
            "nvim-tree/nvim-web-devicons",
        },
        opts = {
            options = {
                show_buffer_close_icons = false,
                show_close_icon = false,
                mode = "buffers",
                truncate_names = false,
                diagnostics = "nvim_lsp",
                offsets = {
                    {
                        filetype = "NvimTree",
                        text = " File Explorer",
                        highlight = "Directory",
                        separator = false,
                    },
                },

            },
        },
    }
}
