return {
	{
		"neanias/everforest-nvim",
		lazy = false,
		priority = 1000,
		config = function()
			require("everforest").setup({
				background = "soft",
				colours_override = function(palette)
					palette.bg0 = "#343F44"
				end,
			})
		end,
	},
}
