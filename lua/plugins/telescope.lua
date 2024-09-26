-- Use the `dependencies` key to specify the dependencies of a particular plugin

return  { -- Fuzzy Finder (files, lsp, etc)
    'nvim-telescope/telescope.nvim',
    event = 'VimEnter',
    dependencies = {
      'nvim-lua/plenary.nvim',
      { -- If encountering errors, see telescope-fzf-native README for installation instructions
        'nvim-telescope/telescope-fzf-native.nvim',
        -- `build` is used to run some command when the plugin is installed/updated.
        -- This is only run then, not every time Neovim starts up.
        build = 'make',

        -- `cond` is a condition used to determine whether this plugin should be
        -- installed and loaded.
        cond = function()
          return vim.fn.executable 'make' == 1
        end,
      },
    },
    opts = {
        defaults = {
            mappings = {
             
            },
            prompt_prefix = " ",
            selection_caret = " ",
            -- open files in the first window that is an actual file.
            -- use the current window if no other window is available.
            get_selection_window = function()
              local wins = vim.api.nvim_list_wins()
              table.insert(wins, 1, vim.api.nvim_get_current_win())
              for _, win in ipairs(wins) do
                local buf = vim.api.nvim_win_get_buf(win)
                if vim.bo[buf].buftype == "" then
                  return win
                end
              end
              return 0
            end,
        },
        extensions = {
            cmdline = {
                picker = {
                  layout_config = {
                    width  = 120,
                    height = 25,
                  }
                },
                mappings    = {
                  complete      = '<Tab>',
                  run_selection = '<C-CR>',
                  run_input     = '<CR>',
                },
            },
        }
      }, 
    config = function(_, opts)
      -- [[ Configure Telescope ]]
      -- See `:help telescope` and `:help telescope.setup()`
      require('telescope').setup(opts)
      -- Enable Telescope extensions if they are installed
      pcall(require('telescope').load_extension, 'fzf')
 
      -- See `:help telescope.builtin`
      local builtin = require 'telescope.builtin'
      vim.keymap.set('n', '<leader>sh', builtin.help_tags, { desc = '[S]earch [H]elp' })
      vim.keymap.set('n', '<leader>sk', builtin.keymaps, { desc = '[S]earch [K]eymaps' })
      vim.keymap.set('n', '<leader>sf', builtin.find_files, { desc = '[S]earch [F]iles' })
      vim.keymap.set('n', '<leader>ss', builtin.lsp_document_symbols, { desc = '[S]earch [S]ymbols' })
      vim.keymap.set('n', '<leader>sw', builtin.grep_string, { desc = '[S]earch current [W]ord' })
      vim.keymap.set('n', '<leader>sg', builtin.live_grep, { desc = '[S]earch by [G]rep' })
      vim.keymap.set('n', '<leader>sd', builtin.diagnostics, { desc = '[S]earch [D]iagnostics' })
      vim.keymap.set('n', '<leader>sr', builtin.resume, { desc = '[S]earch [R]esume' })
      vim.keymap.set('n', '<leader>s.', builtin.oldfiles, { desc = '[S]earch Recent Files ("." for repeat)' })
      vim.keymap.set('n', "gd", builtin.lsp_definitions, { desc = "Goto Definition" })
      vim.keymap.set('n', "gr", "<cmd>Telescope lsp_references<cr>", { desc = "References", nowait = true })
      vim.keymap.set('n', "gI", builtin.lsp_implementations, { desc = "Goto Implementation" })
      vim.keymap.set('n', "gy", builtin.lsp_type_definitions, { desc = "Goto T[y]pe Definition" })
      vim.keymap.set('n', "<leader><space>", ":", {desc = "[S]witch to command mode"})

      -- It's also possible to pass additional configuration options.
      --  See `:help telescope.builtin.live_grep()` for information about particular keys
      vim.keymap.set('n', '<leader>s/', function()
        builtin.live_grep {
          grep_open_files = true,
          prompt_title = 'Live Grep in Open Files',
        }
      end, { desc = '[S]earch [/] in Open Files' })

      -- Shortcut for searching your Neovim configuration files
      vim.keymap.set('n', '<leader>sn', function()
        builtin.find_files { cwd = vim.fn.stdpath 'config' }
      end, { desc = '[S]earch [N]eovim files' })
    end,
  }