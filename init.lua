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

require("config.lazy")
