-- Set leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Set default directory
vim.cmd.cd("~/Dev")

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
