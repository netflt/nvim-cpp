
return {
    {
        "neovim/nvim-lspconfig",
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
                signs = {
                text = {
                    [vim.diagnostic.severity.ERROR] = LazyVim.config.icons.diagnostics.Error,
                    [vim.diagnostic.severity.WARN] = LazyVim.config.icons.diagnostics.Warn,
                    [vim.diagnostic.severity.HINT] = LazyVim.config.icons.diagnostics.Hint,
                    [vim.diagnostic.severity.INFO] = LazyVim.config.icons.diagnostics.Info,
                },
                },
            },
          servers = {
            -- Ensure mason installs the server
            clangd = {
              keys = {
                { "<leader>ch", "<cmd>ClangdSwitchSourceHeader<cr>", desc = "Switch Source/Header (C/C++)" },
              },
              root_dir = function(fname)
                return require("lspconfig.util").root_pattern(
                  ".git",
                  "Makefile",
                  "configure.ac",
                  "configure.in",
                  "config.h.in",
                  "meson.build",
                  "meson_options.txt",
                  "build.ninja"
                )(fname) or require("lspconfig.util").root_pattern("compile_commands.json", "compile_flags.txt")(
                  fname
                ) or require("lspconfig.util").find_git_ancestor(fname)
              end,
              capabilities = {
                offsetEncoding = { "utf-8" },
              },
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
            },
          },
        },
    },
}
