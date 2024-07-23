return {
	{
		"echasnovski/mini.nvim",
		config = function()
			require("mini.ai").setup({ n_lines = 500 })

			require("mini.comment").setup({
				options = {
					custom_commentstring = function()
						return require("ts_context_commentstring").calculate_commentstring() or vim.bo.commentstring
					end,
				},
			})

			require("mini.statusline").setup({
				use_icons = false,
				content = {
					active = function()
						local statusline = require("mini.statusline")
						local mode, mode_hl = statusline.section_mode({ trunc_width = 120 })
						local git = statusline.section_git({ trunc_width = 75 })
						local diagnostics = statusline.section_diagnostics({ trunc_width = 75 })
						local filename = statusline.section_filename({ trunc_width = 340 })
						local fileinfo = statusline.section_fileinfo({ trunc_width = 250 })

						return statusline.combine_groups({
							{ hl = mode_hl, strings = { mode } },
							{ hl = "MiniStatuslineDevinfo", strings = { git, diagnostics } },
							"%<",
							{ hl = "MiniStatuslineFilename", strings = { filename } },
							"%=",
							{ hl = mode_hl, strings = { fileinfo } },
						})
					end,
				},
			})
		end,
	},
}
