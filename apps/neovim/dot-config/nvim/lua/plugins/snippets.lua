return {
  'L3MON4D3/LuaSnip',
  dependencies = {
    'rafamadriz/friendly-snippets',
  },
  config = function()
    local luasnip = require('luasnip')

    -- load snippets from friendly-snippets
    require('luasnip.loaders.from_vscode').lazy_load()
    require('luasnip.loaders.from_vscode').lazy_load({
      paths = { vim.fn.stdpath("config") .. "/snippets" },
    })


    -- optional but recommended
    luasnip.config.setup({
      history = true,
      updateevents = "TextChanged,TextChangedI",
    })
  end,
}
