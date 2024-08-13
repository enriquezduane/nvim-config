return {
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
			"WhoIsSethDaniel/mason-tool-installer.nvim",
		},
		config = function()
			require("mason").setup()

			local servers = {
				lua_ls = {
					settings = {
						Lua = {
							diagnostics = {
								globals = { "vim" },
							},
						},
					},
				},
				clangd = {},
				tsserver = {},
				html = {},
				-- Add other servers here, for example:
				-- pyright = {},
			}

			local formatters = {
				"stylua",
				-- Add formatters here, for example:
				-- 'black',
			}

			local ensure_installed = vim.tbl_keys(servers)
			vim.list_extend(ensure_installed, formatters)

			require("mason-tool-installer").setup({
				ensure_installed = ensure_installed,
				auto_update = true,
				run_on_start = true,
			})

			vim.api.nvim_create_autocmd("LspAttach", {
				callback = function(ev)
					local opts = { buffer = ev.buf }
					vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
					vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
					vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
					vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
					vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)
					vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, opts)
					vim.keymap.set({ "n", "v" }, "<space>ca", vim.lsp.buf.code_action, opts)
					vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
					vim.keymap.set("n", "<space>f", function()
						vim.lsp.buf.format({ async = true })
					end, opts)
				end,
			})

			local capabilities = vim.lsp.protocol.make_client_capabilities()
			capabilities = vim.tbl_deep_extend("force", capabilities, require("cmp_nvim_lsp").default_capabilities())
			require("mason-lspconfig").setup({
				handlers = {
					function(server_name)
						local server_config = servers[server_name] or {}
						server_config.capabilities =
							vim.tbl_deep_extend("force", {}, capabilities, server_config.capabilities or {})
						require("lspconfig")[server_name].setup(server_config)
					end,
				},
			})
		end,
	},
}
