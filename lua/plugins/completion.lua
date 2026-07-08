return {
	"saghen/blink.cmp",
	version = "1.*",
	event = { "InsertEnter", "CmdLineEnter" },
	opts = {
		completion = {
			accept = {
				auto_brackets = {
					enabled = false,
				},
			},
		},
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
				force_version = "v1.9.1",
			},
		},
	},
}
