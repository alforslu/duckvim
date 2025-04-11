return {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    ---@module "ibl"
    ---@type ibl.config
    opts = {},
    config = function()
        require("ibl").setup({
            indent = {
                smart_indent_cap = true,
            },
            scope = {
                enabled = false,
            },
        })
    end
}
