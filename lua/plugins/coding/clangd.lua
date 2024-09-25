return {
    {
        "neovim/nvim-lspconfig",
        event = VeryLazy,
        opts = {
            inlay_hints = { enabled = false },
            diagnostics = {
                underline = false,
                update_in_insert = false,
                virtual_text = {
                spacing = 4,
                source = "if_many",
                prefix = "●",
                -- this will set set the prefix to a function that returns the diagnostics icon based on the severity
                -- this only works on a recent 0.10.0 build. Will be set to "●" when not supported
                -- prefix = "icons",
                },
                severity_sort = true,
            },
        },
        config = function(_, opts)
            local capabilities = require('cmp_nvim_lsp').default_capabilities()
            require'lspconfig'.clangd.setup {
                capabilities = capabilities,
                cmd = {
                "clangd",
                "--background-index",
                "--clang-tidy",
                "--header-insertion=never",
                "--completion-style=detailed",
                "--function-arg-placeholders",
                "--fallback-style=llvm",
                '--compile-commands-dir=' .. vim.fn.getcwd() .. '/build/debug/',
                },
                init_options = {
                usePlaceholders = true,
                completeUnimported = true,
                clangdFileStatus = true,
                },
            }
        end
    },
    {
        "simrat39/symbols-outline.nvim",
        lazy = true,
        cmd = { "SymbolsOutline", "SymbolsOutlineOpen", "SymbolsOutlineClose" },
        keys = {
            { "<leader>cs", "<cmd>SymbolsOutline<CR>", desc = "Toggle outline" },
        },
        opts = {
            highlight_hovered_item = true,
            position = 'right',
            relative_width = true,
            width = 25,
            fold_markers = { '', '' },
        },
    },
}