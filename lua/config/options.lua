-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

---- utf8
vim.g.encoding = "UTF-8"
-- 缩进4个空格等于一个Tab
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
-- >> << 时移动长度
vim.opt.shiftwidth = 4
-- 空格替代tab
vim.opt.expandtab = true
-- 不可见字符的显示，这里只把空格显示为一个点
vim.opt.listchars = "space:·"
-- 关闭自动 format
vim.g.autoformat = false

vim.diagnostic.enable(false)  --disable diagnostic on startup
