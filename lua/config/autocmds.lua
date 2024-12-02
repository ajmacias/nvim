-- resize splits if window got resized
vim.api.nvim_create_autocmd({ "VimResized" }, {
  callback = function()
    vim.cmd "tabdo wincmd ="
  end,
})

-- close some filetypes with <q>
vim.api.nvim_create_autocmd("FileType", {
  pattern = {
    "qf",
    "help",
    "man",
    "notify",
    "lspinfo",
    "spectre_panel",
    "startuptime",
    "tsplayground",
    "PlenaryTestPopup",
  },
  callback = function(event)
    vim.bo[event.buf].buflisted = false
    vim.keymap.set("n", "q", "<cmd>close<cr>", { buffer = event.buf, silent = true })
  end,
})

-- remove all trailing whitespace
vim.api.nvim_create_autocmd({ "BufWritePre" }, {
  callback = function()
    vim.cmd [[%s/\s\+$//e]]
  end,
})

-- enable spell on markdown
vim.api.nvim_create_autocmd("FileType", {
  pattern = {
    "markdown",
  },
  callback = function()
    -- comprobamos si existe el fichero de spell
    -- y lo descargamos si es necesario
    local spellfile = vim.fn.stdpath("config") .. "/spell/es.utf-8.spl"
    if not vim.loop.fs_stat(spellfile) then
      vim.fn.system({
        "curl",
        "https://ftp.nluug.nl/pub/vim/runtime/spell/es.utf-8.spl",
        "-L",
        "-o",
        spellfile
      })
    end
    vim.opt.spelllang = 'es'
    vim.opt.spell = true

    vim.keymap.set("n", "<leader>w", function()
      require("telescope.builtin").spell_suggest()
    end, { desc = "Spelling Suggestions" })
  end,
})

-- show cursor line only in active window
vim.api.nvim_create_autocmd({ "InsertLeave", "WinEnter" }, {
  callback = function()
    local ok, cl = pcall(vim.api.nvim_win_get_var, 0, "auto-cursorline")
    if ok and cl then
      vim.wo.cursorline = true
      vim.api.nvim_win_del_var(0, "auto-cursorline")
    end
  end,
})
vim.api.nvim_create_autocmd({ "InsertEnter", "WinLeave" }, {
  callback = function()
    local cl = vim.wo.cursorline
    if cl then
      vim.api.nvim_win_set_var(0, "auto-cursorline", cl)
      vim.wo.cursorline = false
    end
  end,
})
