return {
  {
    'NMAC427/guess-indent.nvim',
    enabled = false,
    config = function()
      require('guess-indent').setup {}
    end
  },
  {
    'windwp/nvim-autopairs',
    event = "InsertEnter",
    config = true
    -- use opts = {} for passing setup options
    -- this is equivalent to setup({}) function
  },
  {
    "abecodes/tabout.nvim",
    lazy = false,
    config = function()
      require("tabout").setup {}
    end,
  }
}
