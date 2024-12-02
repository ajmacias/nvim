return {
  "mfussenegger/nvim-lint",
  events = "LazyFile",
  config = function()
    local lint = require("lint")

    lint.linters_by_ft = require("config.plugins.tools").linters

    vim.api.nvim_create_autocmd({ "InsertLeave", "BufWritePost", "BufReadPost" }, {
      callback = function()
        require("lint").try_lint()
      end,
    })
  end,
}
