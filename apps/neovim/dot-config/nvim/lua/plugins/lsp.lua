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
              -- expr = "import <nixpkgs> { }",
              expr = "import (builtins.getFlake \"/home/evolve/nix-config\").inputs.nixpkgs { }   ",
            },
            formatting = {
              command = { "nixfmt" },
              -- command = { "alejandra" },
            },
            -- options = {
            --   flake_parts = {
            --     expr = "(builtins.getFlake \"/home/evolve/nix-config\").debug.options"
            --   },
              --   nixos = {
              --     expr = '(builtins.getFlake (builtins.getFlake \"github:e-v-o-l-v-e/nix-config\").nixosConfigurations.waylander.options',
              --   },
              --   home_manager = {
              --     expr = '(builtins.getFlake (builtins.getFlake \"github:e-v-o-l-v-e/nix-config\").homeConfigurations."evolve@waylander".options',
              --   },
            -- },
          },
        },
      })
    end,
  }
}
