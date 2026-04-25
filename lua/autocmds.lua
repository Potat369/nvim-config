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

vim.api.nvim_create_autocmd("BufEnter", {
	callback = function(ctx)
		if vim.bo[ctx.buf].buftype == "help" then
			local win = vim.api.nvim_get_current_win()
			vim.api.nvim_win_set_config(win, {
				vertical = true,
			})
		end
	end,
})

vim.api.nvim_create_autocmd({ "BufWritePre" }, {
	callback = function(event)
		if event.match:match("^%w%w+:[\\/][\\/]") then
			return
		end
		local file = vim.uv.fs_realpath(event.match) or event.match
		vim.fn.mkdir(vim.fn.fnamemodify(file, ":p:h"), "p")
	end,
})
