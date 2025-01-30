-- comprobamos si existe el fichero de spell
-- y lo descargamos si es necesario
local spellfile = vim.fn.stdpath 'config' .. '/spell/es.utf-8.spl'
if not vim.loop.fs_stat(spellfile) then
  vim.fn.system {
    'curl',
    'https://ftp.nluug.nl/pub/vim/runtime/spell/es.utf-8.spl',
    '-L',
    '--create-dirs',
    '-o',
    spellfile,
  }
end

vim.opt_local.conceallevel = 2
vim.opt_local.spelllang = 'es'
vim.opt_local.spell = true

vim.keymap.set('n', '<leader>w', function()
  require('telescope.builtin').spell_suggest()
end, { desc = 'Spelling Suggestions' })
