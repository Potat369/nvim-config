return {
	"nvim-treesitter/nvim-treesitter",
	lazy = false,
	branch = "main",
	build = ":TSUpdate",
	config = function()
		local treesitter = require("nvim-treesitter")
		local treesitter_config = require("nvim-treesitter.config")
		treesitter.setup({ install_dir = vim.fs.joinpath(vim.fn.stdpath("data"), "/treesitter") })
		vim.api.nvim_create_autocmd("FileType", {
			group = vim.api.nvim_create_augroup("vim-treesitter-start", {}),
			callback = function(ctx)
				local langs = treesitter_config.norm_languages(vim.bo[ctx.buf].filetype, { installed = true })
				if langs ~= nil then
					treesitter.install(langs):await(function()
						pcall(vim.treesitter.start)
					end)
				else
					pcall(vim.treesitter.start)
				end
			end,
		})
	end,
}
