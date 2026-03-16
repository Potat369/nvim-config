return {
	"luukvbaal/statuscol.nvim",
	priority = 1000,
	opts = function()
		local builtin = require("statuscol.builtin")

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
