return {
  {
    "NMAC427/guess-indent.nvim",
    enabled = false,
    config = function()
      require("guess-indent").setup({})
    end,
  },
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = true,
    -- use opts = {} for passing setup options
    -- this is equivalent to setup({}) function
  },
  {
    "abecodes/tabout.nvim",
    enabled = true,
    lazy = false,
    config = function()
      require("tabout").setup({
        ignore_beginning = true,
        exclude = { "md" }, -- TODO act as tab when the next char is space
      })
    end,
  },
  {
    "echasnovski/mini.align",
    version = false,
    config = function()
      require("mini.align").setup({
        mappings = {
          start = "ga", -- Press 'ga' in visual mode to start alignment
          start_with = "gA", -- Start alignment with a predefined modifier
        },
      })
    end,
  },
}
