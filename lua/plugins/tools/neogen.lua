return {
  'danymat/neogen',
  opts = {
    snippet_engine = 'luasnip',
  },
  keys = {
    {
      '<Leader>cc',
      function()
        require('neogen').generate {}
      end,
      desc = 'Neogen Comment',
    },
  },
}
