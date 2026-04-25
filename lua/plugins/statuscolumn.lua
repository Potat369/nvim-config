return {
	"luukvbaal/statuscol.nvim",
	priority = 999,
	opts = function()
		local builtin = require("statuscol.builtin")

		vim.o.number = true
		vim.o.relativenumber = true
		vim.o.numberwidth = 2

		return {
			relculright = true,
			bt_ignore = { "help", "nofile", "terminal" },
			ft_ignore = { "checkhealth" },
			segments = {
				{
					sign = {
						namespace = { "gitsign" },
						colwidth = 1,
						maxwidth = 1,
					},
				},
				{
					text = { builtin.lnumfunc, " " },
					click = "v:lua.ScLa",
				},
			},
		}
	end,
}
