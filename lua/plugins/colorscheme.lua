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
				LineNr = { fg = palette.dragonWhite },
				LineNrAbove = { fg = palette.dragonGray, bg = theme.ui.bg_gutter },
				LineNrBelow = { fg = palette.dragonGray, bg = theme.ui.bg_gutter },
				WinSeparator = { fg = palette.dragonBlack4 },
				BlinkCmpCursorLineMenuHack = { bg = palette.waveBlue2 },
			}
		end,
	},
}
