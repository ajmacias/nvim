return {
    {
        "lukas-reineke/virt-column.nvim",
        opts = {
            char = "│",
        },
    },
    {
        "m4xshen/smartcolumn.nvim",
        opts = {
            disabled_filetypes = {
                "netrw",
                "NvimTree",
                "Lazy",
                "mason",
                "help",
                "text",
                "tex",
                "html",
            },
            scope = "window",
        },
    },
}
