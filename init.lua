vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = true
vim.opt.wrap = false
vim.keymap.set('n', '-', ':Explore<CR>', { desc = 'Open file explorer' })

-- load Lazy.nvim plugins
require("config.lazy")

-- nvim-lspconfig
vim.lsp.enable("basedpyright")
vim.lsp.enable("lua_ls")
vim.lsp.enable("vtsls")
vim.lsp.enable("rust_analyzer")

-- nvim-treesitter parsers
require('nvim-treesitter').install { 'rust', 'python', 'html', 'latex', 'yaml' }

-- colorscheme
vim.cmd("colorscheme catppuccin-nvim")
