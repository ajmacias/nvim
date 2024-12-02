local M = {}

function M.setup()
  local hydra = require("hydra")

  hydra.setup()

  local __hydra_defs = {
    {
      body = "<leader><leader>o",
      config = {
        color = "blue",
        hint = { float_opts = { border = "rounded" }, position = "middle" },
        invoke_on_body = true,
      },
      heads = {
        { "q",     ":ObsidianQuickSwitch<CR>" },
        { "t",     ":ObsidianToday<CR>" },
        { "x",     ":ObsidianExtract<CR>" },
        { "s",     ":ObsidianSearch<CR>" },
        { "<Esc>", nil,                       { exit = true } },
      },
      hint = table.concat({
        "Obsidian",
        "_q_: Quick Switch",
        "_t_: Today",
        "_x_: Extract to Note",
        "_s_: Search",
      }, "\n"),
      mode = { "n", "v" },
    },
    -- {
    --   body = "<leader>d",
    --   config = {
    --     color = "blue",
    --     hint = { float_opts = { border = "rounded" }, position = "bottom" },
    --     invoke_on_body = true,
    --   },
    --   heads = {
    --     { "d",  require("dap").continue },
    --     { "bp", require("dap").toggle_breakpoint },
    --     { "l",  require("dap").step_into },
    --     { "j",  require("dap").step_over },
    --     { "k",  require("dap").step_out },
    --     { "h",  require("dapui").eval },
    --     { "c",  require("dap").run_to_cursor },
    --     {
    --       "bc",
    --       function()
    --         vim.ui.input({ prompt = "Condition: " }, function(condition)
    --           if condition == "" then
    --             return
    --           end
    --           require("dap").set_breakpoint(condition)
    --         end)
    --       end,
    --     },
    --     {
    --       "?",
    --       function()
    --         vim.ui.input({ prompt = "Log: " }, function(log)
    --           if log == "" then
    --             return
    --           end
    --           require("dap").set_breakpoint(nil, nil, log)
    --         end)
    --       end,
    --     },
    --     {
    --       "x",
    --       function()
    --         require("dap").terminate()
    --         require("dapui").close({})
    --         require("dap").clear_breakpoints()
    --       end,
    --     },
    --     { "<Esc>", nil, { exit = true } },
    --   },
    --   hint =
    --   "Nvim DAP\n_d_: Start/Continue  _j_: StepOver _k_: StepOut _l_: StepInto ^\n_bp_: Toogle Breakpoint  _bc_: Conditional Breakpoint ^\n_?_: log point ^\n_c_: Run To Cursor ^\n_h_: Show information of the variable under the cursor ^\n_x_: Stop Debbuging ^\n^^                                                      _<Esc>_\n",
    --   mode = "n",
    -- },
  }
  for _, hydra_config in ipairs(__hydra_defs) do
    hydra(hydra_config)
  end
end

return M
