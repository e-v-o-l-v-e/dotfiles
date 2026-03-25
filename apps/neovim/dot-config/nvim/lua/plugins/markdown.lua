return {
  {
    vim.lsp.enable('marksman')
  },
  {
    "OXY2DEV/markview.nvim",
    enabled = false,
    lazy = false,
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-tree/nvim-web-devicons"
    },

    config = function()
      require('markview').setup {
        preview = {
          enable = false
        }
      }

      vim.api.nvim_set_keymap("n", "<leader>mm", "<CMD>Markview<CR>", { desc = "Toggles `markview` previews globally." });
      vim.api.nvim_set_keymap("n", "<leader>mh", "<CMD>Markview HybridToggle<CR>",
        { desc = "Toggles `hybrid mode` previews globally." });
      vim.api.nvim_set_keymap("n", "<leader>ms", "<CMD>Markview splitToggle<CR>",
        { desc = "Toggles `splitview` for current buffer." });
    end
  },
  {
    {
      'MeanderingProgrammer/render-markdown.nvim',
      enabled = false,
      dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-mini/mini.nvim' }, -- if you use the mini.nvim suite
      -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-mini/mini.icons' },        -- if you use standalone mini plugins
      -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons
      ---@module 'render-markdown'
      ---@type render.md.UserConfig
      opts = {},
      config = function()
        require('render-markdown').setup({
          completions = { lsp = { enabled = true } },
          code = {
            sign = false,
            border = "thin",
            position = "right",
            width = "block",
            above = "▁",
            below = "▔",
            language_left = "█",
            language_right = "█",
            language_border = "▁",
            left_pad = 1,
            right_pad = 1,
          },
          heading = {
            width = "block",
            backgrounds = {
              "MiniStatusLineModeNormal",
              "MiniStatusLineModeInsert",
              "MiniStatusLineModeReplace",
              "MiniStatusLineModeVisual",
              "MiniStatusLineModeCommand",
              "MiniStatusLineModeOther",
            },
            sign = false,
            left_pad = 1,
            right_pad = 0,
            position = "right",
            icons = {
              "",
              "",
              "",
              "",
              "",
              "",
            },
            -- icons = {
            --   " ",
            --   " ",
            --   " ",
            --   " ",
            --   " ",
            --   " ",
            -- },
            -- icons = {
            --   "█ ",
            --   "██ ",
            --   "███ ",
            --   "████ ",
            --   "█████ ",
            --   "██████ ",
            -- },
          },
        })
      end
    }
  }
}
