return {
    {
        "tanvirtin/vgit.nvim",
        event = VeryLazy,
        dependencies = {
            'nvim-lua/plenary.nvim'
        },
        config = function()
            require('vgit').setup({
                keymaps = {
                    ['n <C-k>'] = function() require('vgit').hunk_up() end,
                    ['n <C-j>'] = function() require('vgit').hunk_down() end,
                    ['n <leader>gs'] = function() require('vgit').buffer_hunk_stage() end,
                    ['n <leader>gr'] = function() require('vgit').buffer_hunk_reset() end,
                    ['n <leader>gp'] = function() require('vgit').buffer_hunk_preview() end,
                    ['n <leader>gb'] = function() require('vgit').buffer_blame_preview() end,
                    ['n <leader>gf'] = function() require('vgit').buffer_diff_preview() end,
                    ['n <leader>gh'] = function() require('vgit').buffer_history_preview() end,
                    ['n <leader>gu'] = function() require('vgit').buffer_reset() end,
                    ['n <leader>gg'] = function() require('vgit').buffer_gutter_blame_preview() end,
                    ['n <leader>glu'] = function() require('vgit').buffer_hunks_preview() end,
                    ['n <leader>gls'] = function() require('vgit').project_hunks_staged_preview() end,
                    ['n <leader>gd'] = function() require('vgit').project_diff_preview() end,
                    ['n <leader>gq'] = function() require('vgit').project_hunks_qf() end,
                    ['n <leader>gx'] = function() require('vgit').toggle_diff_preference() end,
                },
                settings = {
                    live_blame = {
                        enabled = true,
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
            { "<leader>lg", "<cmd>LazyGit<cr>", desc = "LazyGit" }
        }
    }
}