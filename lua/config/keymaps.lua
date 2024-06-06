vim.g.mapleader = ","
vim.g.localmapleader = ","

local keymap = vim.keymap

-- increment/decrement numbers
keymap.set("n", "<leader>+", "<C-a>", { desc = "Increment number" })
keymap.set("n", "<leader>-", "<C-x>", { desc = "Decrement number" })

-- window management
keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" })
keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" })
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" })
keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" })
keymap.set("n", "<tab>", "<c-w><c-w>", { desc = " Window switch with TAB" })

-- cosas que abro sin querer y prefiero ignorar
keymap.set("n", "Q", "<silent>", {})
keymap.set("n", "q:", "<silent>", {})
keymap.set("n", "K", "<silent>", {})

-- plegado
keymap.set("i", "<F2>", "<C-O>za", { desc = "Toggle fold" })
keymap.set("n", "<F2>", "za", { desc = "Toggle fold" })
keymap.set("v", "<F2>", "zf", { desc = "Toggle fold" })

-- búsqueda
keymap.set("n", "<leader>n", ":nohls<CR>", { desc = "Clear search highlights" })

-- bufferes
keymap.set("n", "<leader>l", ":bnext<cr>", { desc = "Switch to next buffer" })
keymap.set("n", "<leader>h", ":bprevious<cr>", { desc = "Switch to previous buffer" })
keymap.set("n", "<leader>x", ":bp<cr>:bd #<cr>", { desc = "Close current buffer" })

-- indentado
keymap.set("n", "<leader>fef", "ggVG=", { desc = "Indent entire file" })
