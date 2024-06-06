return {
    "nvim-lualine/lualine.nvim",
    dependencies = {
        "nvim-tree/nvim-web-devicons",
    },
    config = function()
        local lualine = require("lualine")
        local lazy_status = require("lazy.status") -- to configure lazy pending updates count

        local colors = {
            blue = "#65D1FF",
            green = "#3EFFDC",
            violet = "#FF61EF",
            yellow = "#FFDA7B",
            red = "#FF4A4A",
            fg = "#c3ccdc",
            bg = "#112638",
            inactive_bg = "#2c3043",
        }

        local my_lualine_theme = {
            normal = {
                a = { bg = colors.blue, fg = colors.bg, gui = "bold" },
                b = { bg = colors.bg, fg = colors.fg },
                c = { bg = colors.bg, fg = colors.fg },
            },
            insert = {
                a = { bg = colors.green, fg = colors.bg, gui = "bold" },
                b = { bg = colors.bg, fg = colors.fg },
                c = { bg = colors.bg, fg = colors.fg },
            },
            visual = {
                a = { bg = colors.violet, fg = colors.bg, gui = "bold" },
                b = { bg = colors.bg, fg = colors.fg },
                c = { bg = colors.bg, fg = colors.fg },
            },
            command = {
                a = { bg = colors.yellow, fg = colors.bg, gui = "bold" },
                b = { bg = colors.bg, fg = colors.fg },
                c = { bg = colors.bg, fg = colors.fg },
            },
            replace = {
                a = { bg = colors.red, fg = colors.bg, gui = "bold" },
                b = { bg = colors.bg, fg = colors.fg },
                c = { bg = colors.bg, fg = colors.fg },
            },
            inactive = {
                a = { bg = colors.inactive_bg, fg = colors.semilightgray, gui = "bold" },
                b = { bg = colors.inactive_bg, fg = colors.semilightgray },
                c = { bg = colors.inactive_bg, fg = colors.semilightgray },
            },
        }

        local custom_filetype = require('lualine.components.filetype'):extend()

        function custom_filetype:update_status()
            local ft = vim.bo.filetype

            if ft == 'php' then
                -- comprobamos si tenemos rellena la variable global
                if vim.g.phpversion == nil then
                    vim.g.phpversion = vim.fn.system("php -r 'echo PHP_VERSION;'");
                end

                ft = string.format("%s %s", ft, vim.g.phpversion)
            end

            return ft
        end

        lualine.setup({
            options = {
                theme = my_lualine_theme,
                icons_enabled = true,
                globalstatus = true,
                section_separators = '',
                component_separators = "|",
            },
            extensions = { "quickfix", "fugitive" },
            sections = {
                lualine_b = { 'branch' },
                lualine_c = { { "filename", file_status = true, path = 1 } },
                lualine_x = {
                    "diagnostics",
                    "diff",
                    {
                        require("noice").api.status.mode.get,
                        cond = require("noice").api.status.mode.has,
                        color = { fg = "#ff9e64" },
                    },
                    {
                        lazy_status.updates,
                        cond = lazy_status.has_updates,
                        color = { fg = "ff9e64" },
                    },
                    "encoding",
                    "fileformat",
                    -- "filetype",
                    custom_filetype,
                },
                lualine_y = { "progress" },
                lualine_z = { "location" },
            },
        })
    end
}
