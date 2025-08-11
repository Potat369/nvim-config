return {
	"saghen/blink.cmp",
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
				force_version = "v1.6.0",
			},
		},
	},
}
