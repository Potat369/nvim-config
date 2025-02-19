return {
	"luukvbaal/statuscol.nvim",
	opts = function()
		local builtin = require("statuscol.builtin")
		return {
			relculright = true,
			segments = {
				{
					sign = {
						name = { "Diagnostic" },
						colwidth = 1,
					},
				},
				{
					text = { builtin.lnumfunc },
				},
				{
					sign = {
						namespace = { "gitsign" },
						colwidth = 1,
					},
				},
			},
		}
	end,
}
