return {
	"luukvbaal/statuscol.nvim",
	opts = function()
		local builtin = require("statuscol.builtin")
		return {
			relculright = true,
			bt_ignore = { "nofile" },
			ft_ignore = { "help", "leetcode.nvim" },
			segments = {
				{
					sign = {
						namespace = { "gitsign" },
						colwidth = 1,
					},
				},
				{
					text = { builtin.lnumfunc },
				},
				{
					sign = {
						name = { "Diagnostic" },
						colwidth = 1,
					},
				},
			},
		}
	end,
}
