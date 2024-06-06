return {
    {
        "williamboman/mason.nvim",
        opts = {
            log_level = vim.log.levels.INFO
        },
        config = function()
            require('mason').setup()
        end,
    },
    {
        "williamboman/mason-lspconfig.nvim",
        requires = {
            "neovim/nvim-lspconfig",
            "williamboman/mason.nvim",
        },
        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = {
                    "emmet_ls",
                    "lua_ls",
                    "tsserver",
                    "phpactor",
                },
            })
        end,
    },
    {
        'WhoIsSethDaniel/mason-tool-installer.nvim',
        requires = {
            'williamboman/mason.nvim',
        },
        config = function()
            require('mason-tool-installer').setup({
                ensure_installed = {
                    'pint',
                    'phpcs',
                    'php-cs-fixer',
                    'twigcs',
                },
            })
        end,
    }
}
