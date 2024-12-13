
return {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons",
        "MunifTanjim/nui.nvim",
    },
    config = function()
        -- Keymaps
        vim.keymap.set('n', '<C-e>', ':Neotree<CR>', { desc = 'Open file [E]xplorer' })
    end
}
