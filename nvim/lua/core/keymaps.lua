local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap

-- remove default keymap for space
keymap("", "<space>", "<Nop>", opts)
-- set leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- 視窗移動
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

keymap("n", "<C-[>", ":BufferLineCyclePrev<CR>", opts)
keymap("n", "<C-]>", ":BufferLineCycleNext<CR>", opts)

-- 快捷儲存
keymap("n", "<leader>w", ":w<CR>", opts)

-- 快捷離開
keymap("n", "<leader>q", ":q<CR>", opts)
keymap("n", "<leader>!", ":q!<CR>", opts)
