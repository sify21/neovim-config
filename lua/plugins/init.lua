return {
    "neovim/nvim-lspconfig",
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
    { -- optional blink completion source for require statements and module annotations
        "saghen/blink.cmp",
        dependencies = { 'rafamadriz/friendly-snippets' },
        version = "1.*",
        opts = {
            sources = {
                -- add lazydev to your completion providers
                default = { "lazydev", "lsp", "path", "snippets", "buffer" },
                providers = {
                    lazydev = {
                        name = "LazyDev",
                        module = "lazydev.integrations.blink",
                        -- make lazydev completions top priority (see `:h blink.cmp`)
                        score_offset = 100,
                    },
                },
            },
            signature = { enabled = true },
            fuzzy = { implementation = "rust" },
        },
    },
    {
        'MeanderingProgrammer/render-markdown.nvim',
        dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' },
        ---@module 'render-markdown'
        ---@type render.md.UserConfig
        opts = {
            file_types = { "markdown", "AgenticChat" },
        },
    },
    {
        "carlos-algms/agentic.nvim",
        opts = {
            -- Available by default: "claude-agent-acp" | "gemini-acp" | "codex-acp" | "opencode-acp" | "cursor-acp" | "auggie-acp" | "mistral-vibe-acp"
            provider = "claude-agent-acp", -- setting the name here is all you need to get started
            acp_providers = {
                ["claude-agent-acp"] = {
                    command = "cursor-agent",
                    args = { "acp" }
                },
            },
            diff_preview = {
                enabled = true,
                layout = "inline", -- "split" or "inline"
                center_on_navigate_hunks = true,
            },
        },
        -- these are just suggested keymaps; customize as desired
        keys = {
            {
                "<leader>a\\",
                function() require("agentic").toggle() end,
                mode = { "n", "v", "i" },
                desc = "Toggle Agentic Chat"
            },
            {
                "<leader>al",
                function() require("agentic").rotate_layout({ "right", "bottom" }) end,
                mode = { "n", "v", "i" },
                desc = "Rotate between Agentic layouts"
            },
            {
                "<leader>a'",
                function() require("agentic").add_selection_or_file_to_context({ focus_prompt = false }) end,
                mode = { "n", "v" },
                desc = "Add file or selection to Agentic to Context"
            },
            {
                "<leader>an",
                function() require("agentic").new_session() end,
                mode = { "n", "v", "i" },
                desc = "New Agentic Session"
            },
            {
                "<leader>ar", -- ai Restore
                function()
                    require("agentic").restore_session()
                end,
                desc = "Agentic Restore session",
                silent = true,
                mode = { "n", "v", "i" },
            },
            {
                "<leader>ad", -- ai Diagnostics
                function()
                    require("agentic").add_current_line_diagnostics({ focus_prompt = false })
                end,
                desc = "Add current line diagnostic to Agentic",
                mode = { "n" },
            },
            {
                "<leader>aD", -- ai all Diagnostics
                function()
                    require("agentic").add_buffer_diagnostics({ focus_prompt = false })
                end,
                desc = "Add all buffer diagnostics to Agentic",
                mode = { "n" },
            },
        },
    }
}
