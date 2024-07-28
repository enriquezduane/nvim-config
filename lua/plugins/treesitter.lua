return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		config = function()
			local configs = require("nvim-treesitter.configs")
			configs.setup({
				ensure_installed = { "c", "lua", "vim", "vimdoc", "html", "javascript", "markdown", "css" },
				auto_install = true,
				sync_install = false,
				highlight = { enable = true },
				indent = { enable = true, disable = { "ruby" } },
			})
		end,
	},
}
