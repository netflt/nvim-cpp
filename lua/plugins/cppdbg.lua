return {
    {
        'rcarriga/nvim-dap-ui',
        event = "VeryLazy",
        dependencies = {
            'mfussenegger/nvim-dap',
            'nvim-neotest/nvim-nio',  
        },
        opts = {
            mappings = {
                -- Use a table to apply multiple mappings
                expand = { "<CR>" },
                open = {"o", "<2-LeftMouse>" },
                remove = "d",
                edit = "e",
                repl = "r",
                toggle = "t",
            },
        },
      
        config = function(_, opts)
          local dap, dapui = require 'dap', require 'dapui'
          dap.listeners.before.attach.dapui_config = function()
            dapui.open()
          end
          dap.listeners.before.launch.dapui_config = function()
            dapui.open()
          end
          dap.listeners.before.event_terminated.dapui_config = function()
            dapui.close()
          end
          dap.listeners.before.event_exited.dapui_config = function()
            dapui.close()
          end
          dapui.setup(opts)
        end,
    },
    {
        "mfussenegger/nvim-dap",
        event = "VeryLazy",
        keys = {},
        config = function()
            local dap = require("dap")
            dap.adapters.gdb = {
                id = 'gdb',
                type = 'executable',
                command = 'gdb',
                args = {'-i','dap'}
            }
            dap.adapters.lldb = {
                id = 'lldb',
                type = 'executable',
                command = '/opt/homebrew/opt/llvm/bin/lldb-dap',
                name = 'lldb'
            }
           
            --mapping = require("config.keymaps").mapDAP()
            vim.api.nvim_set_hl(0, "red",   { fg = "#ff0000" }) 
            vim.api.nvim_set_hl(0, "green",  { fg = "#9ece6a" }) 
            vim.api.nvim_set_hl(0, "yellow", { fg = "#FFFF00" }) 
            vim.api.nvim_set_hl(0, "orange", { fg = "#f09000" }) 

            vim.fn.sign_define('DapBreakpoint',          { text='󰯰', texthl='orange',   linehl='DapBreakpoint', numhl='DapBreakpoint' })
            vim.fn.sign_define('DapBreakpointCondition', { text='󰯳', texthl='orange',   linehl='DapBreakpoint', numhl='DapBreakpoint' })
            vim.fn.sign_define('DapBreakpointRejected',  { text='󰍷', texthl='red', linehl='DapBreakpoint', numhl='DapBreakpoint' })
            vim.fn.sign_define('DapStopped',             { text='', texthl='yellow',  linehl='DapBreakpoint', numhl='DapBreakpoint' })
            vim.fn.sign_define('DapLogPoint',            { text='', texthl='green', linehl='DapBreakpoint', numhl='DapBreakpoint' })
        end,
    },
}

