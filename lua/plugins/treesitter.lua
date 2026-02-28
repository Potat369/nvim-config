return {
	"nvim-treesitter/nvim-treesitter",
	lazy = false,
	branch = "main",
	opts = { install_dir = vim.fs.joinpath(vim.fn.stdpath("data"), "/treesitter") },
	config = function()
		local treesitter = require("nvim-treesitter")

		-- Auto install
		vim.api.nvim_create_autocmd("FileType", {
			group = vim.api.nvim_create_augroup("vim-treesitter-start", {}),
			callback = function(ctx)
				local installed = treesitter.get_installed()
				local ft = vim.treesitter.language.get_lang(vim.bo[ctx.buf].filetype)
				for _, v in ipairs(installed) do
					if v == ft then
						vim.treesitter.start(ctx.buf, ft)
						return
					end
				end

				local available = treesitter.get_available()
				for _, v in ipairs(available) do
					if v == ft then
						treesitter.install(ft):await(function()
							pcall(vim.treesitter.start, ctx.buf, ft)
						end)
						return
					end
				end
			end,
		})
	end,
}
