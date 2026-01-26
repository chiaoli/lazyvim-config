-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Toggle comment with <leader>/
vim.keymap.set("n", "<leader>/", "gcc", { remap = true, desc = "Toggle Comment" })
vim.keymap.set("v", "<leader>/", "gc", { remap = true, desc = "Toggle Comment" })

-- Save file with <leader>w
vim.keymap.set("n", "<leader>w", "<cmd>w<cr>", { desc = "Save File" })

-- Visual mode line movement
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move selected lines down" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move selected lines up" })

-- Toggle terminal with <C-\> (NvChad habit)
vim.keymap.set({ "n", "t" }, "<C-\\>", function()
  Snacks.terminal.toggle()
end, { desc = "Toggle Terminal" })

-- ============================================================================
-- Buffer Navigation (Buffer 管理) - <leader>b 系列
-- ============================================================================

-- <leader>bb: 切換到上一個 buffer (back/previous)
vim.keymap.set("n", "<leader>bb", "<cmd>bprevious<cr>", { desc = "Previous Buffer" })

-- <leader>bn: 切換到下一個 buffer (next)
vim.keymap.set("n", "<leader>bn", "<cmd>bnext<cr>", { desc = "Next Buffer" })

-- <leader>bj: 跳到特定 buffer (jump，使用 Snacks picker)
vim.keymap.set("n", "<leader>bj", function()
  Snacks.picker.buffers()
end, { desc = "Jump to Buffer" })
