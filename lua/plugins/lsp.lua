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
				lua_ls = {
					settings = {
						Lua = {
							workspace = {
								library = {
									vim.env.VIMRUNTIME,
								},
							},
						},
					},
				},
				pylsp = {},
				eslint = {},
			},
		},
		config = function(_, opts)
			local lspconfig = require("lspconfig")
			for server, config in pairs(opts.servers) do
				config.capabilities = require("blink.cmp").get_lsp_capabilities(config.capabilities)
				lspconfig[server].setup(config)
			end
		end,
	},
}
