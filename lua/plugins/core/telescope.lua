return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    "nvim-telescope/telescope-ui-select.nvim",
  },
  event = "VeryLazy",
  config = function()
    require("telescope").setup({
      defaults = {
        layout_config = {
          mirror = true,
          preview_cutoff = 20,
          prompt_position = "top",
        },
        layout_strategy = "vertical",
        prompt_prefix = "🔍 ",
        -- selection_caret = "👉 ",
      },
      extensions = {
        fzf = {
          fuzzy = true,
          override_generic_sorter = true,
          override_file_sorter = true,
          case_mode = "smart_case",
        },
        ["ui-select"] = {
          require("telescope.themes").get_dropdown({})
        }
      },
    })
    require("telescope").load_extension("fzf")
    require("telescope").load_extension("ui-select")
  end,
  keys = {
    {
      "<leader>kb",
      function()
        require("telescope.builtin").keymaps()
      end,
      desc = "Telescope keymaps",
    },
    {
      "<leader>pp",
      function()
        local opts = { show_untracked = true }
        local ok = pcall(require("telescope.builtin").git_files, opts)
        if not ok then
          require("telescope.builtin").find_files(opts)
        end
      end,
      desc = "Telescope: Open Project files",
    },
    {
      "<leader>pb",
      function()
        require("telescope.builtin").git_branches()
      end,
      desc = "Telescope: Git Branches selector",
    },
    {
      "<leader>gs",
      function()
        require("telescope.builtin").git_status()
      end,
      desc = "Telescope: Git status",
    },
    {
      "<leader>ag",
      function()
        require("telescope.builtin").live_grep()
      end,
      desc = "Telescope: Live grep",
    },
    {
      "<leader>ft",
      function()
        require("telescope.builtin").treesitter()
      end,
      desc = "Telescope: Treesitter Symbols"
    },
    {
      "<leader>rp",
      function()
        require("telescope.builtin").find_files({
          prompt_title = "NVIM Plugins",
          cwd = vim.fn.stdpath("config") .. "/lua/plugins",
          attach_mappings = function(_, map)
            local actions = require("telescope.actions")
            local action_state = require("telescope.actions.state")
            map("i", "<c-y>", function(prompt_bufnr)
              local new_plugin = action_state.get_current_line()
              actions.close(prompt_bufnr)
              vim.cmd(string.format("edit ~/.config/nvim/lua/plugins/%s.lua", new_plugin))
            end)
            return true
          end
        })
      end
    },
  }
}
