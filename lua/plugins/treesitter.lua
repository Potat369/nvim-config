return {
	"nvim-treesitter/nvim-treesitter",
	lazy = false,
	branch = "main",
	build = ":TSUpdate",
	opts = { install_dir = vim.fs.joinpath(vim.fn.stdpath("data"), "/treesitter") },
	config = function()
		local treesitter = require("nvim-treesitter")

		-- Auto install
		vim.api.nvim_create_autocmd("FileType", {
			group = vim.api.nvim_create_augroup("vim-treesitter-start", {}),
			callback = function(ctx)
				local installed = treesitter.get_installed()
				local ft = vim.bo[ctx.buf].filetype
				for _, v in ipairs(installed) do
					if v == ft then
						pcall(vim.treesitter.start, ctx.buf, ft)
						break
					end
				end

				local available = treesitter.get_available()
				for _, v in ipairs(available) do
					if v == ft then
						treesitter.install(ft):await(function()
							pcall(vim.treesitter.start, ctx.buf, ft)
						end)
						break
					end
				end
			end,
		})
	end,
}
