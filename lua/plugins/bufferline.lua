return {
    "akinsho/bufferline.nvim",
    version = "*",
    dependencies = "nvim-tree/nvim-web-devicons",
    config = function()
        local bufferline = require("bufferline")
        bufferline.setup({
            options = {
                -- mode = "tabs",
                numbers = "buffer_id",
                diagnostics = "nvim_lsp",
                indicator = {
                    style = "underline",
                },
                offsets = {
                    {
                        filetype = "neo-tree",
                        text = "File Explorer",
                        text_align = "center",
                        separator = true,
                    },
                },
                highlights = {
                    TabLineSel = { fg = '#eb6f92'},
                },
                diagnostics_indicator = function(count, level)
                    local icon = level:match("error") and " " or " "
                    return " " .. icon .. count
                end,
            },
        })
    end,
}
