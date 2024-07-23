return {
	"nvim-neo-tree/neo-tree.nvim",
	version = "*",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"MunifTanjim/nui.nvim",
	},
	cmd = "Neotree",
	keys = {
		{ "\\", ":Neotree float<CR>", { desc = "NeoTree reveal" } },
	},
	opts = {
		filesystem = {
			window = {
				mappings = {
					["\\"] = "close_window",
				},
			},
			-- remove icons
			renderers = {
				file = {
					{ "name" },
				},
				directory = {
					{ "name" },
				},
			},
		},
		buffers = {
			renderers = {
				file = {
					{ "name" },
				},
				directory = {
					{ "name" },
				},
			},
		},
		git_status = {
			renderers = {
				file = {
					{ "name" },
				},
				directory = {
					{ "name" },
				},
			},
		},
	},
}
