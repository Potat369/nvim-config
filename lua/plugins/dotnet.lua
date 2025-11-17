return {
	"GustavEikaas/easy-dotnet.nvim",
	dependencies = { "nvim-telescope/telescope.nvim" },
	config = function()
		require("easy-dotnet").setup()
	end,
}
