return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      {
        "folke/lazydev.nvim",
        ft = "lua", -- only load on lua files
        opts = {
          library = {
            -- See the configuration section for more details
            -- Load luvit types when the `vim.uv` word is found
            { path = "${3rd}/luv/library", words = { "vim%.uv" } },
          },
        },
      },
    },
    config = function()
      vim.lsp.enable('lua_ls')
      vim.lsp.enable('nixd')
      -- vim.lsp.enable('rnix')
      -- vim.lsp.enable('nil_ls')
      vim.lsp.enable('fish_lsp')

      vim.lsp.enable('prismals')
      vim.lsp.enable('ccls')
      vim.lsp.enable('laravel_ls')
      vim.lsp.enable('phpactor')
      vim.lsp.enable('jdtls')
      vim.lsp.enable('ts_ls')

      -- vim.lsp.enable('gdscript')

      -- Register nvim-cmp lsp capabilities
      -- vim.lsp.config("*", { capabilities = require("cmp_nvim_lsp").default_capabilities() })
      vim.lsp.config("*", { capabilities = require('blink.cmp').get_lsp_capabilities() })

      vim.lsp.config('nixd', {
        cmd = { "nixd" },
        settings = {
          nixd = {
            nixpkgs = {
              expr = "import <nixpkgs> { }",
            },
            formatting = {
              command = { "nixfmt" },
            },
            options = {
              nixos = {
                expr = '(builtins.getFlake ("git+file://" + toString /home/evolve/nix-config).nixosConfigurations.waylander.options',
              },
              home_manager = {
                expr = '(builtins.getFlake ("git+file://" + toString /home/evolve/nix-config)).homeConfigurations."evolve@waylander".options',
              },
            },
          },
        },
      })
    end,
  }
}
