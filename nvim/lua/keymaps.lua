-- 设置全局变量“leader”键为空格键
vim.g.mapleader = " "
vim.g.maplocalleader = " "

local map = vim.api.nvim_set_keymap -- 创建快捷键映射函数的别名为“map”
local opt = { noremap = true, silent = true } -- 创建一个配置为opt, 非递归映射，且使用时不显示命令

-- basic 此为基础设置------------------------------------------------

map("n", "Q", ":q<cr>", opt)
map("n", "qQ", ":q!<cr>", opt)
map("n", "W", ":w<cr>", opt)
map("n", "S", ":wq<cr>", opt)
map("n", "U", ":PackerSync<cr>", opt)

map("n", "h", "i", opt)
map("i", "jj", "<esc>", opt)
map("v", "jj", "<esc>", opt)
map("i", "ji", "<esc>la", opt)


-- Orient 修改方向键------------------------------------------------

map("n", "i", "k", opt)
map("n", "k", "j", opt)
map("n", "j", "h", opt)

map("n", "I", "5k", opt)
map("n", "K", "5j", opt)
map("n", "J", "5h", opt)
map("n", "L", "5l", opt)

map("n", "<C-i>", "15k", opt)
map("n", "<C-k>", "15j", opt)
map("n", "<C-j>", "15h", opt)
map("n", "<C-l>", "15l", opt)

map("v", "i", "k", opt)
map("v", "k", "j", opt)
map("v", "j", "h", opt)

map("v", "I", "5k", opt)
map("v", "K", "5j", opt)
map("v", "J", "5h", opt)
map("v", "L", "5l", opt)

map("v", "<C-i>", "15k", opt)
map("v", "<C-k>", "15j", opt)
map("v", "<C-j>", "15h", opt)
map("v", "<C-l>", "15l", opt)

-- Split window 分屏------------------------------------------------
map("n", "s", "", opt)
-- windows 分屏快捷键
map("n", "sl", ":vsp<CR>", opt)
map("n", "sj", ":vsp<CR><C-w>h", opt)
map("n", "sk", ":sp<CR>", opt)
map("n", "si", ":sp<CR><C-w>k", opt)
-- 关闭当前
map("n", "sc", "<C-w>c", opt)
-- 关闭其他
map("n", "so", "<C-w>o", opt)
-- Alt + hjkl  窗口之间跳转
map("n", "<A-j>", "<C-w>h", opt)
map("n", "<A-k>", "<C-w>j", opt)
map("n", "<A-i>", "<C-w>k", opt)
map("n", "<A-l>", "<C-w>l", opt)

-- 左右比例控制
map("n", "<A-L>", ":vertical resize -5<CR>", opt)
map("n", "<A-J>", ":vertical resize +5<cr>", opt)
map("n", "<leader>l", ":vertical resize -20<CR>", opt)
map("n", "<leader>j", ":vertical resize +20<CR>", opt)
-- 上下比例
map("n", "<leader>i", ":resize +10<CR>", opt)
map("n", "<leader>k", ":resize -10<CR>", opt)
map("n", "<A-I>", ":resize +5<CR>", opt)
map("n", "<A-K>", ":resize -5<CR>", opt)
-- 等比例
map("n", "s=", "<C-w>=", opt)

-- Terminal 终端------------------------------------------------

map("n", "<leader>t", ":sp | terminal<CR>", opt)
map("n", "<leader>vt", ":vsp | terminal<CR>", opt)
map("t", "<Esc>", "<C-\\><C-n>", opt)
map("t", "<A-j>", [[ <C-\><C-N><C-w>h ]], opt)
map("t", "<A-k>", [[ <C-\><C-N><C-w>j ]], opt)
map("t", "<A-j>", [[ <C-\><C-N><C-w>k ]], opt)
map("t", "<A-l>", [[ <C-\><C-N><C-w>l ]], opt)

-- Visual 在visual模式下的按键------------------------------------------------

-- 缩进代码
map("v", "<", "<gv", opt)
map("v", ">", ">gv", opt)
-- 上下移动选中文本
map("v", "<C-K>", ":move '>+1<CR>gv-gv", opt)
map("v", "<C-I>", ":move '<-2<CR>gv-gv", opt)
-- 在visual 模式里粘贴不要复制
map("v", "p", '"_dP', opt)
-- insert 模式下，跳到行首行尾
map("i", "<C-j>", "<ESC>I", opt)
map("i", "<C-l>", "<ESC>A", opt)


-- 插件快捷键
local pluginKeys = {} -- 创建插件快捷变量，可以在其他lua文件中调用以下各个插件的快捷键
-- nvim-tree
-- alt + m 键打开关闭tree
map("n", "<A-m>", ":NvimTreeToggle<CR>", opt)
-- 列表快捷键
pluginKeys.nvimTreeList = {
 -- 打开文件或文件夹
 { key = { "<CR>", "o", "<2-LeftMouse>" }, action = "edit" },
 -- 分屏打开文件
 { key = "v", action = "vsplit" },
 { key = "h", action = "split" },
 -- 显示隐藏文件
 --
-- { key = "i", action = "toggle_custom" }, -- 对应 filters 中的 custom (node_modules)
 { key = ".", action = "toggle_dotfiles" }, -- Hide (dotfiles)
 -- 文件操作
 { key = "<F5>", action = "refresh" },
 { key = "a", action = "create" },
 { key = "d", action = "remove" },
 { key = "r", action = "rename" },
 { key = "x", action = "cut" },
 { key = "c", action = "copy" },
 { key = "p", action = "paste" },
}

-- bufferline
-- 左右Tab切换
map("n", "<C-j>", ":BufferLineCyclePrev<CR>", opt)
map("n", "<C-l>", ":BufferLineCycleNext<CR>", opt)
-- 关闭
--"moll/vim-bbye"
map("n", "<C-w>", ":Bdelete!<CR>", opt)
map("n", "<leader>bl", ":BufferLineCloseRight<CR>", opt)
map("n", "<leader>bh", ":BufferLineCloseLeft<CR>", opt)
map("n", "<leader>bc", ":BufferLinePickClose<CR>", opt)


-- Telescope
-- 查找文件
map("n", "<C-f>", ":Telescope find_files<CR>", opt)
-- 全局搜索
map("n", "<C-F>", ":Telescope live_grep<CR>", opt)

-- Telescope 列表中 插入模式快捷键
pluginKeys.telescopeList = {
  i = {
    -- 上下移动
    ["<C-k>"] = "move_selection_next",
    ["<C-i>"] = "move_selection_previous",
    ["<Down>"] = "move_selection_next",
    ["<Up>"] = "move_selection_previous",
    -- 历史记录
    ["<C-n>"] = "cycle_history_next",
    ["<C-p>"] = "cycle_history_prev",
    -- 关闭窗口
    ["<C-c>"] = "close",
    -- 预览窗口上下滚动
    ["<C-I>"] = "preview_scrolling_up",
    ["<C-K>"] = "preview_scrolling_down",
  },
}


return pluginKeys
