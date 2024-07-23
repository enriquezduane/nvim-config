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

-- Set colorscheme based on operating system
local function is_macos()
	return vim.loop.os_uname().sysname == "Darwin"
end

local function is_arch()
	return vim.fn.filereadable("/etc/arch-release") == 1
end

if is_macos() then
	vim.cmd.colorscheme("catppuccin")
elseif is_arch() then
	vim.cmd.colorscheme("everforest")
else
	vim.cmd.colorscheme("default")
end

-- Set neovide configuration
if vim.g.neovide then
	require("core.neovide").setup()
end
