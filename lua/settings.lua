vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.g.have_nerd_font = true

-- Remap C-c to Esc
vim.keymap.set({ "n", "i", "v" }, "<C-c>", "<Esc>", { noremap = true, silent = true })

-- Indentation
vim.cmd("set expandtab")
vim.cmd("set tabstop=4")
vim.cmd("set softtabstop=4")
vim.cmd("set shiftwidth=4")

-- Line numbers
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = false -- Might automate this later idk
vim.opt.scrolloff = 10     -- Amount of lines minimum at bottom or top

-- Hide duplicate mode text
vim.opt.showmode = false

-- Disable netrw (to enable hijack with neo-tree)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Sync clipboard between OS and nvim
vim.schedule(function()
    vim.opt.clipboard = "unnamedplus"
end)

-- Undo history
vim.opt.undofile = true

-- Enable break indenting
vim.opt.breakindent = true

-- Case insensitive searching (Put \C if want case search)
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Signcolumn (side of line numbers) always on
vim.opt.signcolumn = "yes"

-- Lower update time
vim.opt.updatetime = 250

-- Lower time for which-key and similar plugins
vim.opt.timeoutlen = 300

-- Split settings
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Whitespace settings
vim.opt.list = true
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }

-- Live changes in replace and such
vim.opt.inccommand = "split"
