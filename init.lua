vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = true
vim.opt.wrap = false
vim.opt.mousescroll = "ver:1,hor:1"

-- load Lazy.nvim plugins
require("config.lazy")

-- oil.nvim
vim.keymap.set('n', '-', '<CMD>Oil<CR>', { desc = 'Open parent directory' })

-- nvim-lspconfig
vim.lsp.enable("basedpyright")
vim.lsp.enable("lua_ls")
vim.lsp.enable("vtsls")
vim.lsp.enable("rust_analyzer")
vim.lsp.enable("jdtls")

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
local _builtin = require('telescope.builtin')
local _CallTelescope = function(input, opts)
    opts = opts or {}
    local theme = require('telescope.themes').get_dropdown(opts)
    input(theme)
end
vim.keymap.set('n', '<leader>ff', function () _CallTelescope(_builtin.find_files) end, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>fg', function () _CallTelescope(_builtin.live_grep) end, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>fb', function () _CallTelescope(_builtin.buffers) end, { desc = 'Telescope buffers' })
vim.keymap.set('n', '<leader>fh', function () _CallTelescope(_builtin.help_tags) end, { desc = 'Telescope help tags' })
vim.keymap.set('n', '<leader>fs', function () _CallTelescope(_builtin.lsp_document_symbols) end, { desc = 'Telescope LSP document symbols' })
vim.keymap.set('n', '<leader>fr', function () _CallTelescope(_builtin.lsp_references) end, { desc = 'Telescope LSP references' })
vim.keymap.set('n', '<leader>ft', function () _CallTelescope(_builtin.treesitter) end, { desc = 'Lists Function names, variables, ... using treesitter locals queries' })
vim.keymap.set('n', '<leader>fd', function () _CallTelescope(_builtin.diagnostics, {bufnr=0}) end, { desc = 'Lists Diagnostics for current buffer' })
vim.keymap.set('n', '<leader>fD', function () _CallTelescope(_builtin.diagnostics) end, { desc = 'Lists All Diagnostics' })
