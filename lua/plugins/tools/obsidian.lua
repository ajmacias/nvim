return {
  "epwalsh/obsidian.nvim",
  cmd = { "ObsidianQuickSwitch", "ObsidianToday", "ObsidianExtract", "ObsidianSearch" },
  dependencies = {
    "nvim-lua/plenary.nvim",
    "hrsh7th/nvim-cmp",
    "nvim-telescope/telescope.nvim",
  },
  opts = {
    picker = {
      name = "telescope.nvim"
    },
    workspaces = {
      {
        name = "personal",
        path = "~/.vaults/personal",
      },
    }
  }
}
