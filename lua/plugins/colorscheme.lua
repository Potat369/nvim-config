return {
	"rebelot/kanagawa.nvim",
	init = function()
		vim.cmd("colorscheme kanagawa-dragon")
	end,
	opts = {
		overrides = function(colors)
			local theme = colors.theme
			local palette = colors.palette
			return {
				LineNr = { fg = theme.syn.string, bg = "" },
				LineNrAbove = { fg = theme.ui.nontext, bg = "" },
				LineNrBelow = { fg = theme.ui.nontext, bg = "" },
				GitSignsAdd = { fg = theme.vcs.added, bg = "" },
				GitSignsChange = { fg = theme.vcs.changed, bg = "" },
				GitSignsDelete = { fg = theme.vcs.removed, bg = "" },
				SignColumn = { bg = "" },
				WinSeparator = { fg = theme.ui.bg_p1 },
				BlinkCmpCursorLineMenuHack = { bg = theme.ui.bg_search },
			}
		end,
	},
}
