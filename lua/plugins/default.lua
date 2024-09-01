-- every spec file under the "plugins" directory will be loaded automatically by lazy.nvim
--
-- In your plugin files, you can:
-- * add extra plugins
-- * disable/enabled LazyVim plugins
-- * override the configuration of LazyVim plugins
return {
    {"folke/tokyonight.nvim", enabled = false},
    { "projekt0n/github-nvim-theme" },
    {
        "LazyVim/LazyVim",
        opts = {
            colorscheme = "github_dark",
        },
    },
}
