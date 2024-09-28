return {
    {
        "tanvirtin/vgit.nvim",
        dependencies = {
            'nvim-lua/plenary.nvim'
        },
        keys = {
            { "<leader>gp","<cmd> lua require('vgit').project_diff_preview() <CR>", desc = "Project diff preview" },
            { "<leader>gb","<cmd> lua require('vgit').buffer_blame_preview() <CR>", desc = "Buffer blame preview" },
            { "<leader>gc","<cmd> lua require('vgit').buffer_history_preview() <CR>", desc = "Buffer history preview" },
            { "<leader>gh","<cmd> lua require('vgit').buffer_hunk_preview() <CR>", desc = "Buffer hunk preview" },
            { "<leader>gd","<cmd> lua require('vgit').buffer_diff_preview() <CR>", desc = "Buffer diff preview" },
        },
        config = function()
            require('vgit').setup({
                settings = {
                    live_blame = {
                        enabled = true,
                    },
                    live_gutter = {
                        enabled = false,
                        edge_navigation = false,  -- This allows users to navigate within a hunk
                    },
                    scene = {
                        diff_preference = 'split',
                        keymaps = {
                        quit = 'q'
                        }
                    },
                
                }
            })
        end
    },
    {
        "kdheepak/lazygit.nvim",
        cmd = {
            "LazyGit",
            "LazyGitConfig",
            "LazyGitCurrentFile",
            "LazyGitFilter",
            "LazyGitFilterCurrentFile",
        },
        -- optional for floating window border decoration
        dependencies = {
            "nvim-lua/plenary.nvim",
        },
        -- setting the keybinding for LazyGit with 'keys' is recommended in
        -- order to load the plugin when the command is run for the first time
        keys = {
            { "<leader>gg", "<cmd>LazyGit<cr>", desc = "LazyGit" }
        },
        config = function()
            require("telescope").load_extension("lazygit")
        end,
    }
}
