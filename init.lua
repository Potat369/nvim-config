vim.g.mapleader = " "
vim.g.localmapleader = " "
vim.keymap.set("n", "<leader>o", "<CMD>Oil<CR>", { desc = "Open parent directory" })
vim.diagnostic.config({ virtual_text = true })

vim.o.expandtab = true
vim.o.shiftwidth = 4
vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.smartindent = true
vim.o.wrap = false

vim.o.number = true
vim.o.relativenumber = true
vim.o.numberwidth = 2

vim.o.inccommand = "split"
vim.o.splitright = true
vim.o.splitbelow = true
vim.o.scrolloff = 8
vim.o.confirm = true

vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
	callback = function()
		vim.hl.on_yank({ timeout = 50, higroup = "BlinkCmpCursorLineMenuHack" })
	end,
})

vim.keymap.set("n", "<leader>gs", ":Gitsigns stage_hunk<CR>", { desc = "Stage hunk" })
vim.keymap.set("n", "<leader>gp", ":Gitsigns preview_hunk<CR>", { desc = "Preview hunk" })
vim.keymap.set("n", "<leader>gn", ":Gitsigns next_hunk<CR>", { desc = "Next hunk" })
vim.keymap.set("n", "<leader>gi", ":Gitsigns preview_hunk_inline<CR>", { desc = "Preview hunk inline" })
vim.keymap.set("n", "<leader>gc", function()
	local message = vim.fn.input("Enter commit message: ")
	vim.fn.execute('!git commit -m "' .. message .. '"')
end, { desc = "Commit" })

require("config.lazy")
