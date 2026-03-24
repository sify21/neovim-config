vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = true
vim.opt.wrap = false

-- load Lazy.nvim plugins
require("config.lazy")

-- oil.nvim
vim.keymap.set('n', '-', '<CMD>Oil<CR>', { desc = 'Open parent directory' })

-- nvim-lspconfig
vim.lsp.enable("basedpyright")
vim.lsp.enable("lua_ls")
vim.lsp.enable("vtsls")
vim.lsp.enable("rust_analyzer")

-- nvim-treesitter parsers
require('nvim-treesitter').install { 'rust', 'python', 'html', 'latex', 'yaml', 'java' }

-- nvim-treesitter textobjects
local _select = require "nvim-treesitter-textobjects.select"
vim.keymap.set({ "x", "o" }, "af", function() _select.select_textobject("@function.outer", "textobjects") end)
vim.keymap.set({ "x", "o" }, "if", function() _select.select_textobject("@function.inner", "textobjects") end)
vim.keymap.set({ "x", "o" }, "ac", function() _select.select_textobject("@class.outer", "textobjects") end)
vim.keymap.set({ "x", "o" }, "ic", function() _select.select_textobject("@class.inner", "textobjects") end)
vim.keymap.set({ "x", "o" }, "ab", function() _select.select_textobject("@block.outer", "textobjects") end)
vim.keymap.set({ "x", "o" }, "ib", function() _select.select_textobject("@block.inner", "textobjects") end)

-- colorscheme
vim.cmd("colorscheme catppuccin-nvim")

-- telescope
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })
vim.keymap.set('n', '<leader>fs', builtin.lsp_document_symbols, { desc = 'Telescope LSP document symbols' })
vim.keymap.set('n', '<leader>fr', builtin.lsp_references, { desc = 'Telescope LSP references' })
