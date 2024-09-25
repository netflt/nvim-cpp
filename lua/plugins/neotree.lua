return {
    'nvim-neo-tree/neo-tree.nvim',
    version = '*',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
      'MunifTanjim/nui.nvim',
    },
    cmd = 'Neotree',
    keys = {
      { '<leader>e', ':Neotree reveal<CR>', desc = 'Open NeoTree', silent = true },
    },
    opts = {
        enable_git_status = true,
        enable_diagnostics = true,
        open_files_do_not_replace_types = { "terminal", "trouble", "qf" }, -- when opening files, do not use windows containing these filetypes or buftypes
        sort_case_insensitive = false, -- used when sorting files and directories in the tree
        sort_function = nil , -- use a custom function for sorting files and directories in the tree 
        sources = { "filesystem", "buffers", "git_status" },
        default_component_configs = {
            indent = {
                highlight = "NeoTreeIndentMarker",
                -- expander config, needed for nesting files
                with_expanders = nil, -- if nil and file nesting is enabled, will enable expanders
                expander_collapsed = "",
                expander_expanded = "",
                expander_highlight = "NeoTreeExpander",
            },
            icon = {
                folder_closed = "",
                folder_open = "",
                folder_empty = "",
                default = "*",
                highlight = "NeoTreeFileIcon"
            },
            
            git_status = {
                symbols = {
                -- Change type
                added     = "✚", -- or "✚", but this is redundant info if you use git_status_colors on the name
                modified  = "", -- or "", but this is redundant info if you use git_status_colors on the name
                deleted   = "✖",-- this can only be used in the git_status source
                renamed   = "󰁕",-- this can only be used in the git_status source
                -- Status type
                untracked = "",
                ignored   = "",
                unstaged  = "󰄱",
                staged    = "",
                conflict  = "",
                }
            },
        },
        filesystem = {
            window = {
                mappings = {
                    ["<space>"] = { "toggle_node", nowait = false},
                    ['<leader>e'] = { 'close_window', desc = "Close NeoTree"},
                    -- disable `nowait` if you have existing combos starting with this char that you want to use 
                    --["<cr>"] = { "toggle_node", nowait = false, },
                },
            },
            filtered_items = {
                visible = true,
                show_hidden_count = true,
                hide_dotfiles = false,
                hide_gitignored = true,
                hide_by_name = {
                    --'.git', '.DS_Store',  -- 'thumbs.db',
                },
                never_show = {'.git'},
            },
        },
    },
}
