-- Set leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Set default directory if it exists
local default_dir = "~/Dev"
if vim.fn.isdirectory(vim.fn.expand(default_dir)) == 1 then
	vim.cmd.cd(default_dir)
end

-- Activate settings and plugins
require("core.options")
require("core.keymaps")
require("core.autocmds")
require("lazy-bootstrap")
require("lazy-setup")

-- Set colorscheme
vim.cmd.colorscheme("catppuccin")

-- Set neovide configuration
if vim.g.neovide then
	require("core.neovide").setup()
end
