require "nvchad.options"

-- add yours here!

local o = vim.opt
local g = vim.g

o.nu = true
o.relativenumber = true

o.tabstop = 4
o.softtabstop = 4
o.shiftwidth = 4
o.expandtab = true

o.swapfile = false
o.backup = false
o.undodir = os.getenv("HOME") .. "/.vim/undodir"
o.undofile = true

o.hlsearch = false
o.incsearch = true

o.scrolloff = 8
o.signcolumn = "yes"
o.isfname:append("@-@")

o.updatetime = 50

o.colorcolumn = "80"

g.mapleader = " "

-- o.cursorlineopt ='both' -- to enable cursorline!
