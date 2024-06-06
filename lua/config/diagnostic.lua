vim.cmd.highlight('DiagnosticUnderlineError guisp=#ff0000 gui=undercurl')

vim.diagnostic.config({
    underline = true,
    virtual_text = true,
    float = {
        border = "rounded"
    },
})

-- local signs = { Error = "", Warn = "", Hint = "󰌶", Info = "" }
local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
for type, icon in pairs(signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end
