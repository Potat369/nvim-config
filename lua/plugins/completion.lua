return {
	"saghen/blink.cmp",
	event = "InsertEnter",
	dependencies = { "L3MON4D3/LuaSnip" },
	opts = {
		signature = { enabled = true },
		snippets = { preset = "luasnip" },
		sources = {
			default = { "lsp", "path", "snippets", "buffer" },
			providers = {
				cmdline = {
					enabled = function()
						return vim.fn.getcmdtype() ~= ":" or not vim.fn.getcmdline():match("^[%%0-9,'<>%-]*!")
					end,
				},
			},
		},
		fuzzy = {
			prebuilt_binaries = {
				force_version = "v1.6.0",
			},
		},
	},
}
