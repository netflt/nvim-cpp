-- every spec file under the "plugins" directory will be loaded automatically by lazy.nvim
--
-- In your plugin files, you can:
-- * add extra plugins
-- * disable/enabled LazyVim plugins
-- * override the configuration of LazyVim plugins
return {
    { "projekt0n/github-nvim-theme" },
    {
        "LazyVim/LazyVim",
        tag = "v12.38.2",
        opts = {
        colorscheme = "github_dark",
        },
    },
    {
        "nvim-treesitter/nvim-treesitter",
        opts = { ensure_installed = { "cpp" } },
    },
}
