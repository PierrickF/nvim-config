-- General
vim.g.mapleader = " "                       -- Leader key is spacebar

vim.keymap.set("i", "kj", "<ESC>")          -- Press escape in editing mode

vim.keymap.set("n", "<leader>w", ":w<CR>")  -- Write file
vim.keymap.set("n", "<leader>e", ":NvimTreeOpen<CR>")   -- Open / leave file explorer

-- Navigation
vim.keymap.set("i", "<C-h>", [[<C-\><C-N><C-w>h]])
vim.keymap.set("i", "<C-l>", [[<C-\><C-N><C-w>l]])

vim.keymap.set("n", "<C-h>", "<C-w>h")
vim.keymap.set("n", "<C-l>", "<C-w>l")
vim.keymap.set("n", "<leader>q", "ZZ")
vim.keymap.set("n", "<leader><leader>", "<c-^>")
