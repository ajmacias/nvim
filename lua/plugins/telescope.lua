local M = {}

function M.project_files()
    local opts = { show_untracked = true }
    local ok = pcall(require("telescope.builtin").git_files, opts)
    if not ok then
        require("telescope.builtin").find_files(opts)
    end
end

function M.file_browser(opts)
    opts = opts or {}

    opts = {
        path = opts.path,
        sorting_strategy = "ascending",
        scroll_strategy = "cycle",
        layout_config = {
            prompt_position = "top",
        },
    }

    return require("telescope").extensions.file_browser.file_browser(opts)
end

return {
    "nvim-telescope/telescope.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons",
        "folke/todo-comments.nvim",
        "nvim-telescope/telescope-file-browser.nvim",
    },
    event = "VeryLazy",
    config = function()
        require("telescope").setup({})
        require("telescope").load_extension "notify"
        require("telescope").load_extension "file_browser"

        local builtin = require("telescope.builtin")
        vim.keymap.set("n", "<leader>kb", builtin.keymaps, { desc = "Telescope: Keymaps" })
        vim.keymap.set("n", "<leader>pp", M.project_files, { desc = "Telescope: Open Project files" })
        vim.keymap.set("n", "<leader>pf", M.file_browser, { desc = "Telescope: Project directory" })
        vim.keymap.set("n", "<leader>pb", builtin.git_branches, { desc = "Telescope: Git Branches selector" })
        vim.keymap.set("n", "<leader>gs", builtin.git_status, { desc = "Telescope: Git status" })
        vim.keymap.set("n", "<leader>ag", builtin.live_grep, { desc = "Telescope: Live grep" })
        vim.keymap.set("n", "<leader>ft", builtin.treesitter, { desc = "Telescope: Treesitter Symbols" })
        vim.keymap.set("n", "<leader>ft", "<cmd>TodoTelescope<cr>", { desc = "Telescope: Find TODOs" })
    end,
}
