return {
	"saghen/blink.cmp",
	version = "*",
	event = "InsertEnter",
	opts = {
		signature = { enabled = true },
		sources = {
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
				force_version = "v0.13.0",
			},
		},
	},
}
