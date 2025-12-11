return {
  "OXY2DEV/markview.nvim",
  lazy = false,
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "nvim-tree/nvim-web-devicons"
  },

  config = function ()
    require('markview').setup {
      preview = {
        enable = false
      }
    }

    vim.api.nvim_set_keymap("n", "<leader>mm", "<CMD>Markview<CR>", { desc = "Toggles `markview` previews globally." });
    vim.api.nvim_set_keymap("n", "<leader>mh", "<CMD>Markview HybridToggle<CR>", { desc = "Toggles `hybrid mode` previews globally." });
    vim.api.nvim_set_keymap("n", "<leader>ms", "<CMD>Markview splitToggle<CR>", { desc = "Toggles `splitview` for current buffer." });
  end
}
