local M = {}

function M.setup()
	vim.g.neovide_cursor_vfx_mode = "pixiedust"
	vim.g.neovide_padding_top = 35
	vim.g.neovide_padding_left = 28
	vim.g.neovide_padding_right = 28
	vim.g.neovide_padding_bottom = 10
	vim.opt.linespace = 6
	vim.cmd("colorscheme oxocarbon")
end

return M
