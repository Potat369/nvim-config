return {
	{
		"neovim/nvim-lspconfig",
		event = { "BufReadPre", "BufNewFile" },
		opts = {
			servers = {
				rust_analyzer = {},
				tailwindcss = {},
				nil_ls = {},
				phpactor = {},
				astro = {},
				ts_ls = {},
				roslyn_ls = {},
				emmet_language_server = {},
				cssls = {},
				c3_lsp = {
					cmd = { "c3-lsp" },
				},
				lua_ls = {
					settings = {
						Lua = {
							workspace = {
								library = vim.api.nvim_list_runtime_paths(),
							},
						},
					},
				},
				pyrefly = {},
				eslint = {},
			},
		},
		config = function(_, opts)
			for server, config in pairs(opts.servers) do
				config.capabilities =
					require("blink.cmp").get_lsp_capabilities(vim.tbl_deep_extend("force", config.capabilities or {}, {
						textDocument = {
							completion = {
								completionItem = {
									documentationFormat = { "plaintext" },
								},
							},
							hover = {
								contentFormat = { "plaintext" },
							},
						},
					}))
				vim.lsp.config(server, config)
				vim.lsp.enable(server)
			end
		end,
	},
}
