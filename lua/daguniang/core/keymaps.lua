vim.g.mapleader = " "

local keymap = vim.keymap -- for conciseness

-- general keymaps
-- keymap.set("i", "jk", "<ESC>")
keymap.set("n", "<leader>nh", ":nohl<CR>")

-- 设置删除单个字符, 不将存储到寄存器中
keymap.set("n", "x", '"_x')

-- 分割窗口设置
keymap.set("n", "<leader>ww", "<C-w>v")
keymap.set("n", "<leader>wv", "<C-w>v")
keymap.set("n", "<leader>wh", "<C-w>s")
keymap.set("n", "<leader>we", "<C-w>=")
keymap.set("n", "<leader>wx", ":close<CR>")

-- tab设置
keymap.set("n", "<leader>to", ":tabnew<CR>")
keymap.set("n", "<leader>tx", ":tabclose<CR>")
keymap.set("n", "<leader>tn", ":tabn<CR>")
keymap.set("n", "<leader>tp", ":tabp<CR>")

-- 设置 s 映射 Nop, 防止误触
keymap.set("n", "s", "<Nop>")

keymap.set("i", "<C-H>", "<ESC>I")
keymap.set("i", "<C-L>", "<ESC>A")
keymap.set("n", "<C-H>", "^")
keymap.set("n", "<C-L>", "$")

-- 设置分屏窗口最大化
keymap.set("n", "<leader>sm", ":MaximizerToggle<CR>")

-- nvim-tree
-- keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>")
-- keymap.set("n", "<leader>o", ":NvimTreeFindFileToggle<CR>")

-- neo-tree
keymap.set("n", "<leader>e", ":NeoTreeShowToggle<CR>")
keymap.set("n", "<leader>nf", ":NeoTreeFocus<CR>")

-- telescope
keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<CR>")
keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<CR>")
keymap.set("n", "<leader>fw", "<cmd>Telescope grep_string<CR>")
keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<CR>")
keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<CR>")

-- 翻页
keymap.set("n", "<C-f>", "40j")
keymap.set("n", "<C-b>", "40k")
keymap.set("i", "<C-f>", "<ESC>40ji")
keymap.set("i", "<C-b>", "<ESC>40ki")

-- bufferline
keymap.set("n", "<C-k>", ":BufferLineCyclePrev<CR>")
keymap.set("n", "<C-j>", ":BufferLineCycleNext<CR>")

keymap.set("n", "H", "<C-W>h")
keymap.set("n", "J", "<C-W>j")
keymap.set("n", "K", "<C-W>k")
keymap.set("n", "L", "<C-W>l")
