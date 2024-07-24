local opt = vim.opt

-- Line numbers
opt.number = true
opt.relativenumber = true

-- Indentation and tabs
opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.autoindent = true

-- Search
opt.hlsearch = true
vim.o.hlsearch = false
opt.incsearch = true
opt.inccommand = "split"

-- Appearance
opt.termguicolors = true
opt.background = "dark"
opt.cursorline = true
opt.scrolloff = 8
opt.sidescrolloff = 6
opt.guicursor = ""
opt.shortmess:append("aSIF")
opt.showmode = false
vim.o.pumheight = 10

-- Mouse
opt.mouse = "a"

-- Limit oldfiles
opt.shada = "!,'20,<50,s10,h"

-- Line numbers
opt.number = true
opt.relativenumber = true

-- Set case insensitive search
opt.ignorecase = true
opt.smartcase = true

-- Clipboard
opt.clipboard:append("unnamedplus")

-- Editing
opt.backspace = "indent,eol,start"
opt.iskeyword:remove("_")
opt.jumpoptions = "stack,view"

-- Save undo history
opt.undofile = true

-- Completion
opt.completeopt = "menuone,noinsert,noselect"
