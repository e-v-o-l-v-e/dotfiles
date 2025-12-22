vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

require("config.lazy")

-- vim.o.background = "light"

vim.g.have_nerd_font = true
vim.o.spell = false

-- left collumns
vim.o.number = true
vim.o.relativenumber = true

vim.o.signcolumn = "no"

-- keep history
vim.o.undofile = true

-- search
vim.o.ignorecase = true
vim.o.smartcase = true

-- splitting
vim.o.splitright = true
vim.o.splitbelow = true

-- Decrease update time
vim.o.updatetime = 250

-- Decrease mapped sequence wait time
vim.o.timeoutlen = 300

-- char
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

---- tab char
vim.o.shiftwidth = 2
vim.o.expandtab = true

vim.o.scrolloff = 7
vim.o.cursorline = true

-- Preview substitutions live, as you type!
-- vim.o.inccommand = 'split'

-- clear hightlight when escaping
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

vim.o.confirm = true

-- KEYMAPS --

-- save
vim.keymap.set('n', '<leader>w', ':update<cr>', { desc = 'Save File' })

-- buffer

vim.keymap.set('n', '<leader>bn', ':bn<cr>', { desc = ' [B]uffer [N]ext' })
vim.keymap.set('n', '<leader>bp', ':bp<cr>', { desc = ' [B]uffer [P]revious' })
vim.keymap.set('n', '<leader>bd', ':bd<cr>', { desc = ' [B]uffer [D]elete' })

-- windows
vim.keymap.set('n', '<c-h>', '<c-w>h')
vim.keymap.set('n', '<c-j>', '<c-w>j')
vim.keymap.set('n', '<c-k>', '<c-w>k')
vim.keymap.set('n', '<c-l>', '<c-w>l')

vim.keymap.set('n', '<c-q>', '<c-w>q')

vim.keymap.set('n', '<leader>v', ':vs<cr>', { desc = 'Split Window [V]ertically' })
vim.keymap.set('n', '<leader>h', ':split<cr>', { desc = 'Split Window [H]orizontally' })

-- lsp
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })
vim.keymap.set('n', 'grf', ':lua vim.lsp.buf.format()<cr>' , { desc = 'Format buffer' })

-- source
-- vim.keymap.set('n', '<leader>x', ":.lua<CR>", { desc = 'source line' })
-- vim.keymap.set('v', '<leader>x', ":lua<CR>", { desc = 'source line' })
vim.keymap.set('n', '<leader>x', "<cmd>source %<CR>", { desc = 'source file' })

-- terminal
vim.api.nvim_create_autocmd('TermOpen', {
  group = vim.api.nvim_create_augroup('custom-term-open', { clear = true }),
  callback = function()
    vim.opt.number = false
    vim.opt.relativenumber = false
    vim.cmd("startinsert")
  end,
})

local kb_term = function(loc)
  vim.cmd.vnew()
  vim.cmd.term()
  if loc == 'v' then
    vim.cmd.wincmd("L")
    vim.api.nvim_win_set_width(0, 45)
  elseif loc == 'h' then
    vim.cmd.wincmd("J")
    vim.api.nvim_win_set_height(0, 10)
  end
end

vim.keymap.set('n', '<leader>tv', function () kb_term('v') end, { desc = 'open terminal in vertical split window'})
vim.keymap.set('n', '<leader>th', function () kb_term('h') end, { desc = 'open terminal in horizontal split window'})
vim.keymap.set('n', '<c-t>', function () kb_term('h') end)
-- vim.keymap.set('i', '<c-t>', function () kb_term('h') end)

-- AUTOCOMMAND --
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.hl.on_yank()
  end,
})

-- disabled default keybinds
-- vim.keymap.del("i", "<c-t>")


require 'nvim-treesitter'.install { 'lua', 'nix', 'java', 'c', 'php', 'sql' }
