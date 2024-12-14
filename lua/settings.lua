vim.g.mapleader = " "


-- Remap C-c to Esc
vim.keymap.set({ 'n', 'i', 'v' }, '<C-c>', '<Esc>', { noremap = true, silent = true })

-- Indentation
vim.cmd("set expandtab")
vim.cmd("set tabstop=4")
vim.cmd("set softtabstop=4")
vim.cmd("set shiftwidth=4")

-- Line numbers


