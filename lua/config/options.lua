local o = vim.o

vim.g.mapleader = " "
vim.g.localmapleader = " "
vim.keymap.set("n", "<leader>o", "<CMD>Oil<CR>", { desc = "Open parent directory" })
vim.diagnostic.config({ virtual_text = true })

o.expandtab = true
o.shiftwidth = 4
o.tabstop = 4
o.softtabstop = 4
o.smartindent = true
o.wrap = false

o.number = true
o.relativenumber = true
o.numberwidth = 2
