return {
  'L3MON4D3/LuaSnip',
  lazy = true,
  dependencies = { 'rafamadriz/friendly-snippets' },
  keys = {
    {
      '<Tab>',
      function()
        local ls = require('luasnip').jump(1)
      end,
      expr = true,
      silent = true,
      mode = { 'i', 's' },
    },
    {
      '<S-Tab>',
      function()
        local ls = require('luasnip').jump(-1)
      end,
      expr = true,
      silent = true,
      mode = { 'i', 's' },
    },
  },
  config = function()
    require('luasnip.loaders.from_lua').lazy_load()
  end,
}
