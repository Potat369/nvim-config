return {
	{
		"neovim/nvim-lspconfig",
		dependencies = { "saghen/blink.cmp" },
		opts = {
			servers = {
				rust_analyzer = {},
				tailwindcss = {},
				nil_ls = {},
				phpactor = {},
				astro = {},
				ts_ls = {},
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
				pylsp = {},
				eslint = {},
			},
		},
		config = function(_, opts)
			for server, config in pairs(opts.servers) do
				config.capabilities = require("blink.cmp").get_lsp_capabilities(config.capabilities)
				vim.lsp.config(server, config)
				vim.lsp.enable(server)
			end
		end,
	},
}
