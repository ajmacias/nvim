return {
  "catppuccin/nvim",
  name = "catppuccin",
  lazy = false,
  priority = 1000,
  config = function()
    require("catppuccin").setup({
      flavour = "mocha",
      custom_highlights = function(colors)
        return {
          VertSplit = { fg = colors.surface0 },
        }
      end,
    })
    vim.cmd([[colorscheme catppuccin]])
  end,
}
