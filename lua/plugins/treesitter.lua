return {
	{ -- Highlight, edit, and navigate code
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		opts = {
			ensure_installed = { "c", "html", "lua" },
			auto_install = true,
			highlight = { enable = true },
			indent = { enable = true, disable = { "ruby" } },
		},
		config = function(_, opts)
			-- prefer git instead of curl
			require("nvim-treesitter.install").prefer_git = true
			require("nvim-treesitter.configs").setup(opts)
		end,
	},
}
