return {
  {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    lazy = false,
    build = ":TSUpdate",
    config = function()
      require('nvim-treesitter').setup {
        highlight = {
          enable = true,       -- false will disable the whole extension
          additional_vim_regex_highlighting = true,
        },
        indent = { enable = true },
      }
    end,
  }
}

