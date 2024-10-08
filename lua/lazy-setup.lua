require("lazy").setup({
	spec = {
		{ import = "plugins" },
		{ import = "plugins.colorscheme" },
	},
	defaults = {
		-- lazy = true, -- Uncomment to make all plugins lazy-loaded by default
	},
	install = {
		colorscheme = { "default" },
	},
	checker = {
		enabled = false,
	},
	performance = {
		rtp = {
			disabled_plugins = {
				"gzip",
				"matchit",
				"matchparen",
				"netrwPlugin",
				"tarPlugin",
				"tohtml",
				"tutor",
				"zipPlugin",
			},
		},
	},
})
