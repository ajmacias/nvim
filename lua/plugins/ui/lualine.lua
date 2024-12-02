return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  opts = {
    options = {
      component_separators = '',
      globalstatus = true,
      icons_enabled = true,
      section_separators = '',
      theme = "auto",
    },
    sections = {
      lualine_c = { { "filename", file_status = true, path = 1, } },
      lualine_x = {
        "diagnostics",
        "diff",
      },
      lualine_y = { "filetype" },
      lualine_z = { "location" }
    },
  },
}
