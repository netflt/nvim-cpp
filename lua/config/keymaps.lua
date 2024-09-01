-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here


local map = vim.api.nvim_set_keymap

-- 复用 opt 参数
local opt = { noremap = true, silent = true }
map("n", "r", "<C-r>", opt)
-- 取消 s 默认功能
map("n", "s", "", opt)
-- windows 分屏快捷键
map("n", "sv", ":vsp<CR>", opt)
map("n", "sh", ":sp<CR>", opt)
-- 关闭当前
map("n", "sc", "<C-w>c", opt)
-- 关闭其他
map("n", "so", "<C-w>o", opt)
-- Alt + hjkl  窗口之间跳转
map("n", "<A-h>", "<C-w>h", opt)
map("n", "<A-j>", "<C-w>j", opt)
map("n", "<A-k>", "<C-w>k", opt)
map("n", "<A-l>", "<C-w>l", opt)

-- 左右比例控制
map("n", "s,", ":vertical resize -20<CR>", opt)
map("n", "s.", ":vertical resize +20<CR>", opt)
-- 上下比例
--map("n", "sj", ":resize +10<CR>", opt)
--map("n", "sk", ":resize -10<CR>", opt)
-- 等比例
--map("n", "s=", "<C-w>=", opt)


-- 左右Tab切换
map("n", "<C-h>", ":BufferLineCyclePrev<CR>", opt)
map("n", "<C-l>", ":BufferLineCycleNext<CR>", opt)

-- insert 模式下，跳到行首行尾
map("i", "<C-h>", "<ESC>I", opt)
map("i", "<C-l>", "<ESC>A", opt)

-- 快速滚动
map("n", "<C-k>", "9k", opt)
map("n", "<C-j>", "9j", opt)

-- jump to define
map("n", "<leader>j", "<C-]>", opt)
map("v", "<leader>j", "<C-]>", opt)
map("n", "<leader>k", "<C-o>", opt)
map("v", "<leader>k", "<C-o]>", opt)

-- visual模式下缩进代码
map("v", "<", "<gv", opt)
map("v", ">", ">gv", opt)

-- 上下移动选中文本
map("v", "J", ":move '>+1<CR>gv-gv", opt)
map("v", "K", ":move '<-2<CR>gv-gv", opt)


-- 退出
map("n", "q", ":q<CR>", opt)
map("n", "qq", ":q!<CR>", opt)
map("n", "Q", ":qa!<CR>", opt)

map("t", "<Esc>", "<C-\\><C-n>", opt)

--cmake 
map("n", "<leader>cg", ":CMakeGenerate<CR>",opt)
map("n", "<leader>cb", ":CMakeBuild<CR>", opt)
map("n", "<leader>ci", ":CMakeInstall<CR>", opt)

--dap debug
map ("n",
    "<leader>ds",
    ":lua if vim.fn.filereadable('launch.json') then require('dap.ext.vscode').load_launchjs('launch.json', {lldb = {'c', 'cpp'}}) end<CR>"  
    .. ":lua require('dap').continue()<CR>",
    opt
)

map(
    "n",
    "<leader>de",
    ":lua require'dap'.close()<CR>"
      .. ":lua require'dap'.terminate()<CR>"
      .. ":lua require'dap.repl'.close()<CR>"
      .. ":lua require'dapui'.close()<CR>"
      .. "<C-w>o<CR>",
    opt
  )

map("n", "<F5>", ":lua require('dap').continue()<CR>", opt)
map("n", "<F6>", ":lua require('dap').step_over()<CR>", opt)
map("n", "<F7>", ":lua require('dap').step_into()<CR>", opt )
map("n", "<F8>", ":lua require('dap').step_out()<CR>", opt)

map("n", "<F9>", ":lua require('dap').toggle_breakpoint()<CR>", opt)
map("n", "<F10>", ":lua require('dap').set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>", opt)
map("n", "<F11>", ":lua require('dap').set_breakpoint({ nil, nil, vim.fn.input('Log point message: ') })<CR>", opt)
map("n", "<F1>", ":lua require('dap.ui.variables').hover()<CR>", opt)
map("v", "<F2>", ":lua require('dap.ui.variables').visual_hover()<CR>", opt)
map("n", "<F3>", ":lua require('dap').clear_breakpoints()<CR>", opt)
