vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.g.have_nerd_font = true
vim.opt.termguicolors = true

-- Remap C-c to Esc
vim.keymap.set({ "n", "i", "v" }, "<C-c>", "<Esc>", { noremap = true, silent = true })

-- Indentation
vim.opt.expandtab = true -- Convert tabs to spaces
-- vim.opt.tabstop = 4      -- Number of spaces for a tab
-- vim.opt.softtabstop = 4  -- Number of spaces a <Tab> or <BS> counts for in insert mode
-- vim.opt.shiftwidth = 4   -- Number of spaces for indentation

-- This is why above is commented out, automatically detect but never >4
vim.g.sleuth_default_width = 4
vim.api.nvim_create_autocmd("BufEnter", {
    callback = function()
        if vim.opt.shiftwidth:get() > 4 then
            vim.opt.shiftwidth = 4
        end
        if vim.opt.tabstop:get() > 4 then
            vim.opt.tabstop = 4
        end
        if vim.opt.softtabstop:get() > 4 then
            vim.opt.softtabstop = 4
        end
    end,
})

-- Clipboard (only runs if copyq is installed)

-- if vim.fn.executable("copyq") == 1 then
--     vim.g.clipboard = {
--         name = "copyq",
--         cache_enabled = 1,
--     }
-- end

-- Line numbers
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = false -- Might automate this later idk
vim.opt.scrolloff = 10 -- Amount of lines minimum at bottom or top

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
-- vim.opt.listchars = { tab = "  ", trail = "·", nbsp = "␣" }

-- Live changes in replace and such
vim.opt.inccommand = "split"
