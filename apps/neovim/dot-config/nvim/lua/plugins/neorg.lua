return {
  "nvim-neorg/neorg",
  enabled = false,
  lazy = false, -- Disable lazy loading as some `lazy.nvim` distributions set `lazy = true` by default
  -- version = "*", -- Pin Neorg to the latest stable release
  version = false,
  config = function()
    require('neorg').setup({

      load = {
        ["core.defaults"] = {},
        ["core.dirman"] = {
          config = {
            workspaces = {
              notes = "~/Notes",
            },
          },
        },
        ["core.export"] = {},
        ["core.export.markdown"] = {},
        ["core.export.html"] = {},
        ["core.looking-glass"] = {},
        ["core.keybinds"] = {},
        ["core.summary"] = {},
      },
    })

    -- fixes parser not launching for some reason
    vim.api.nvim_create_autocmd("FileType", {
      pattern = { "norg", "neorg" },
      callback = function()
        if pcall(vim.treesitter.start) then
          vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
          vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
        end
      end,
    })
  end,
  dependencies = {
    'nvim-neorg/tree-sitter-norg',
    'nvim-telescope/telescope.nvim'
  }
}
