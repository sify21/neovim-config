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
vim.lsp.enable("basedpyright")
vim.lsp.enable("lua_ls")
vim.lsp.enable("vtsls")
