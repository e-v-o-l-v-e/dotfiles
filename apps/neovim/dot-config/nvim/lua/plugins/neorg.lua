return {
  "nvim-neorg/neorg",
  lazy = false, -- Disable lazy loading as some `lazy.nvim` distributions set `lazy = true` by default
  -- version = "*", -- Pin Neorg to the latest stable release
  version = false,
  config = function()
    require('neorg').setup()

    -- vim.opt.rtp:prepend('~/.local/share/nvim/lazy-rocks/tree-sitter-norg/lib/lua/5.1/parser')

    -- vim.api.nvim_create_autocmd("FileType", {
    --   pattern = { "norg", "neorg" },
    --   callback = function()
    --     if pcall(vim.treesitter.start) then
    --       vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
    --       vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
    --     end
    --   end,
    -- })
  end,
  dependencies = {
    'nvim-neorg/tree-sitter-norg',
    'nvim-telescope/telescope.nvim'
  }
}
