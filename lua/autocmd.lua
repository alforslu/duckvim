-- Function to toggle `list` based on mode
vim.api.nvim_create_autocmd({ "InsertEnter" }, {
    callback = function()
        vim.opt.list = false -- Disable `list` in Insert mode
    end,
})

vim.api.nvim_create_autocmd({ "InsertLeave" }, {
    callback = function()
        vim.opt.list = true -- Re-enable `list` in Normal mode
    end,
})

-- Highlight yank
vim.api.nvim_create_autocmd("TextYankPost", {
    desc = "Highlight when yanking (copying) text",
    group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
    callback = function()
        vim.highlight.on_yank()
    end,
})

-- Debug buffer details
-- vim.api.nvim_create_autocmd("BufEnter", {
--     callback = function()
--         local bufname = vim.api.nvim_buf_get_name(0)
--         local buftype = vim.bo.filetype
--         print("Buffer Name:", bufname, "Filetype:", buftype)
--     end,
-- })

-- Debug cmp
vim.api.nvim_create_autocmd("CompleteChanged", {
  callback = function()
    require("blink.cmp").show_documentation()
  end,
})
