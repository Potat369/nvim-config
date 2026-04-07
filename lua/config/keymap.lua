vim.g.mapleader = " "
vim.g.localmapleader = " "

vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

vim.keymap.set("n", "<leader>b", "", { desc = "Buffer" })
vim.keymap.set("n", "<leader>bo", ":%bd|e#<CR>", { desc = "Close all buffers except current" })

vim.keymap.set("n", "<leader>o", "<CMD>Oil<CR>", { desc = "Open parent directory" })

vim.keymap.set("n", "<C-c>", ":%y+<CR>", { desc = "Copy entire buffer" })

-- Better comment keymaps
vim.keymap.del({ "n", "x" }, "gc")
vim.keymap.del("n", "gcc")
vim.keymap.set({ "n", "x" }, "gc", function()
	return require("vim._comment").operator() .. "_"
end, { expr = true, desc = "Toggle comment line" })
vim.keymap.set("n", "gC", function()
	return require("vim._comment").operator()
end, { expr = true, desc = "Toggle comment" })
