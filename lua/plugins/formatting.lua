return {
	"stevearc/conform.nvim",
	event = "BufWritePre",
	opts = {
		formatters_by_ft = {
			typst = { "typstyle" },
			lua = { "stylua" },
			python = { "isort", "black" },
			nix = { "nixfmt" },
			javascript = { "prettier" },
			javascriptreact = { "prettier" },
			typescriptreact = { "prettier" },
			typescript = { "prettier" },
			html = { "prettier" },
		},
		format_on_save = {
			timeout_ms = 1000,
			lsp_format = "fallback",
		},
		notify_no_formatters = false,
	},
}
