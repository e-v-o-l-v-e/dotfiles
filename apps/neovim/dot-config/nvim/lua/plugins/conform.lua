return {
  "stevearc/conform.nvim",
  opts = {},
  config = function()
    require("conform").setup({
      formatters_by_ft = {
        lua = { "stylua" },
        javascript = { "prettierd", "prettier", stop_after_first = true },
      },

      formatters = {
        stylua = {
          prepend_args = { "--indent-type", "Spaces", "--indent-width", "2" },
        },
      },
    })

    -- FIX: Wrap the format call in a function, and use 0 for the current buffer
    vim.keymap.set("n", "grf", function()
      require("conform").format({
        bufnr = 0, -- 0 always means "the current active buffer"
        async = true,
        lsp_format = "fallback",
      })
    end, { desc = "Format current buffer" })
  end,
}
