-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- We remap window split to match tmux
vim.keymap.del("n", "<leader>|")
vim.keymap.del("n", "<leader>-")
vim.keymap.set("n", "<leader>%", "<C-w>v")
vim.keymap.set("n", '<leader>"', "<C-w>s")
