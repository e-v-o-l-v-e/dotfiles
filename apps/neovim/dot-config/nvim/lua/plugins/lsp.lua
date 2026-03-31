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
      -- keymaps
      vim.api.nvim_set_keymap("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", { noremap = true, silent = true })
      vim.api.nvim_set_keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", { noremap = true, silent = true })

      -- languages
      vim.lsp.enable('basedpyright')

      vim.lsp.enable('biome')

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


      local diagnostic_signs = {
        Error = " ",
        Warn = " ",
        Hint = "",
        Info = "",
      }

      vim.diagnostic.config({
        virtual_text = { prefix = "●", spacing = 4 },
        signs = {
          text = {
            [vim.diagnostic.severity.ERROR] = diagnostic_signs.Error,
            [vim.diagnostic.severity.WARN] = diagnostic_signs.Warn,
            [vim.diagnostic.severity.INFO] = diagnostic_signs.Info,
            [vim.diagnostic.severity.HINT] = diagnostic_signs.Hint,
          },
        },
        underline = true,
        update_in_insert = false,
        severity_sort = true,
        float = {
          border = "rounded",
          source = true,
          header = "",
          prefix = "",
          focusable = false,
          style = "minimal",
        },
      })

      vim.keymap.set("n", "<leader>D", function()
        vim.diagnostic.open_float({ scope = "line" })
      end, { desc = "show line diagnostic" })
      vim.keymap.set("n", "<leader>d", function()
        vim.diagnostic.open_float({ scope = "cursor" })
      end, { desc = "show cursor diagnostic" })
      vim.keymap.set("n", "<leader>nd", function()
        vim.diagnostic.jump({ count = 1 })
      end, { desc = "go to next diagnostic" })

      vim.keymap.set("n", "<leader>pd", function()
        vim.diagnostic.jump({ count = -1 })
      end, { desc = "go to previous diagnostic" })

      -- vim.lsp.enable('clangd')
      vim.lsp.config('clangd', {
        cmd = { "clangd", "--clang-tidy", "-j=5", "--malloc-trim" },
        filetypes = { "c" }
      })

      vim.lsp.config('nixd', {
        cmd = { "nixd" },
        settings = {
          nixd = {
            nixpkgs = {
              expr = "import (builtins.getFlake \"/home/evolve/nix-config\").inputs.nixpkgs { }",
            },
            formatting = {
              command = { "nixfmt" },
            },
            options = {
              flake_parts = {
                -- expr = "(builtins.getFlake \"github:e-v-o-l-v-e/nix-config/flake-parts\").debug.options"
                expr = "(builtins.getFlake \"/home/evolve/nix-config\").debug.options"
              },
              flake_parts2 = {
                -- expr = "(builtins.getFlake \"github:e-v-o-l-v-e/nix-config/flake-parts\").currentSystem.options"
                expr = "(builtins.getFlake \"/home/evolve/nix-config\").currentSystem.options"
              },
              nixos = {
                expr =
                -- "(builtins.getFlake \"github:e-v-o-l-v-e/nix-config/flake-parts\").nixosConfigurations.waylander.options",
                "(builtins.getFlake \"/home/evolve/nix-config\").nixosConfigurations.waylander.options",
              },
              -- home_manager = {
              --   expr =
              --   -- "(builtins.getFlake \"github:e-v-o-l-v-e/nix-config/flake-parts\").homeConfigurations.\"evolve@waylander\".options",
              --   "(builtins.getFlake \"/home/evolve/nix-config\").homeConfigurations.\"evolve@waylander\".options",
              -- },
              nixpkgs = {
                expr = "import <nixpkgs> { }",
              }
            },
          },
        },
      })

      vim.lsp.enable('digestif')

      vim.lsp.enable('ltex_plus')
      vim.lsp.config('ltex_plus', {
        settings = {
          ltex = {
            language = "en-GB",
          },
        },
      })
    end,
  }
}
