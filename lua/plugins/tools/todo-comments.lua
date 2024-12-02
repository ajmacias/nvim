return {
  "folke/todo-comments.nvim",
  lazy = true,
  event = { "BufRead", "BufNewFile" },
  dependencies = "nvim-lua/plenary.nvim",
  keys = {
    { "<leader>td", "<cmd>TodoTelescope<CR>", desc = "[To-Do] Toggle list" },
  },
  cmd = { "TodoTrouble", "TodoTelescope", "TodoLocList", "TodoQuickFix" },
  config = function()
    require("todo-comments").setup()

    vim.keymap.set({ "n", "v" }, "<leader>tcp", require("todo-comments").jump_prev, { desc = "To-Do previous inline" })
    vim.keymap.set({ "n", "v" }, "<leader>tcn", require("todo-comments").jump_next, { desc = "To-Do next inline" })
  end,
}
