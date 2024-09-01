return {
    {
        'rcarriga/nvim-dap-ui',
        dependencies = {
          'mfussenegger/nvim-dap',
          'nvim-neotest/nvim-nio', -- Assuming this is also a dependency you want to include
          'theHamsta/nvim-dap-virtual-text'
        },
        opts = {},
      
        config = function()
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
          dapui.setup()
        end,
    },
    {
        "mfussenegger/nvim-dap",
        event = "VeryLazy",
        keys = {
                    },
        config = function()
            local dap = require("dap")
            dap.adapters.lldb = {
                type = 'executable',
                command = '/opt/homebrew/opt/llvm@18/bin/lldb-dap',
                name = 'lldb'
            }

           
            --dap.configurations.c = dap.configurations.cpp
            --dap.configurations.rust = dap.configurations.cpp
            --mapping = require("config.keymaps").mapDAP()
        end,
    },
}

