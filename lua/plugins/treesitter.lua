return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    branch = "main",
    config = function()
        require("nvim-treesitter").install({ "c", "cpp", "lua", "vim", "vimdoc", "rust" })
        -- local config = require("nvim-treesitter.configs")
        -- config.setup({
        --     -- ensure_installed = {"c", "cpp", "lua", "vim", "vimdoc"},
        --     auto_install = true,
        --     highlight = { enable = true },
        --     indent = { enable = true },
        -- })
    end,
}
