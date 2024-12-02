return {
  "adalessa/laravel.nvim",
  dependencies = {
    "nvim-telescope/telescope.nvim",
    "nvim-treesitter/nvim-treesitter",
  },
  cmd = { "Sail", "Artisan", "Composer", "Npm", "Yarn", "Laravel" },
  keys = {
    { "<leader>la", ":Laravel artisan<cr>" },
    { "<leader>lr", ":Laravel routes<cr>" },
    {
      "<leader>lt",
      function()
        require("laravel").app.sendToTinker()
      end,
      mode = "v",
      desc = "Laravel Application Routes",
    },
  },
  event = { "VeryLazy" },
  config = function()
    require("laravel").setup()
    require("telescope").load_extension "laravel"
  end,
}
