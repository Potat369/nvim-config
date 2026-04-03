vim.g.mapleader = " "
vim.g.localmapleader = " "

require("config.lazy")

vim.keymap.set("n", "<leader>o", "<CMD>Oil<CR>", { desc = "Open parent directory" })
vim.diagnostic.config({ virtual_text = true })

vim.g.loaded_python3_provider = 0
vim.g.loaded_ruby_provider = 0
vim.g.loaded_perl_provider = 0

vim.o.expandtab = true
vim.o.shiftwidth = 4
vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.smartindent = true
vim.o.autoindent = true
vim.o.wrap = false

vim.o.number = true
vim.o.relativenumber = true
vim.o.numberwidth = 2

vim.o.inccommand = "split"
vim.o.splitright = true
vim.o.scrolloff = 8
vim.o.confirm = true

vim.o.lazyredraw = true

vim.o.breakindent = true
vim.o.undofile = true
vim.o.ignorecase = true
vim.o.smartcase = true

vim.o.redrawtime = 10000
vim.o.maxmempattern = 20000

vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	callback = function()
		vim.hl.on_yank({ timeout = 50, higroup = "BlinkCmpCursorLineMenuHack" })
	end,
})

vim.api.nvim_create_autocmd("VimResized", {
	callback = function()
		vim.cmd("tabdo wincmd =")
	end,
})

vim.keymap.set("n", "<leader>gs", ":Gitsigns stage_hunk<CR>", { desc = "Git stage hunk" })
vim.keymap.set("n", "<leader>gp", ":Gitsigns preview_hunk<CR>", { desc = "Git preview hunk" })
vim.keymap.set("n", "<leader>gn", ":Gitsigns next_hunk<CR>", { desc = "Git next hunk" })
vim.keymap.set("n", "<leader>gi", ":Gitsigns preview_hunk_inline<CR>", { desc = "Git preview hunk inline" })
vim.keymap.set("n", "<leader>gr", ":Gitsigns reset_hunk<CR>", { desc = "Git reset hunk" })
vim.keymap.set("n", "<leader>gc", function()
	local message = vim.fn.input("Enter commit message: ")
	vim.fn.execute('!git commit -m "' .. message .. '"')
end, { desc = "Git commit" })

vim.api.nvim_create_autocmd("BufEnter", {
	callback = function(ctx)
		if vim.bo[ctx.buf].buftype == "help" then
			local win = vim.api.nvim_get_current_win()
			vim.api.nvim_win_set_config(win, {
				vertical = true,
				width = 78,
				fixed = false,
			})
		end
	end,
})

vim.keymap.set("n", "<leader>bo", ":%bd|e#<CR>", { desc = "Close all buffers except current" })
