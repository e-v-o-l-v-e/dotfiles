vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

require("config.lazy")

-- vim.o.background = "light"

vim.g.have_nerd_font = true

vim.o.number = true
vim.o.relativenumber = true

-- keep history
vim.o.undofile = true

-- case insensitive search
vim.o.ignorecase = true
vim.o.smartcase = true

vim.o.signcolumn = "auto"

vim.o.splitright = true
vim.o.splitbelow = true


-- Decrease update time
vim.o.updatetime = 250

-- Decrease mapped sequence wait time
vim.o.timeoutlen = 300

-- Sets how neovim will display certain whitespace characters in the editor.
--  See `:help 'list'`
--  and `:help 'listchars'`
--
--  Notice listchars is set using `vim.opt` instead of `vim.o`.
--  It is very similar to `vim.o` but offers an interface for conveniently interacting with tables.
--   See `:help lua-options`
--   and `:help lua-options-guide`
vim.o.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

vim.o.shiftwidth = 2
vim.o.expandtab = true

-- Preview substitutions live, as you type!
-- vim.o.inccommand = 'split'

-- clear hightlight when escaping
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

vim.o.scrolloff = 7
vim.o.cursorline = true

vim.o.confirm = true

vim.keymap.set('n', '<leader>w', ':update<cr>', { desc = 'Save File' })

vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

vim.keymap.set('n', '<leader>x', ":.lua<CR>", { desc = 'source line' })
vim.keymap.set('v', '<leader>x', ":lua<CR>", { desc = 'source line' })
vim.keymap.set('n', '<leader><leader>x', "<cmd>source %<CR>", { desc = 'source file' })

vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.hl.on_yank()
  end,
})

require 'nvim-treesitter'.install { 'lua', 'nix', 'java', 'c', 'php', 'sql' }
