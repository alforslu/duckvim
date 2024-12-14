return {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons",
        "MunifTanjim/nui.nvim",
    },
    config = function()
        require("neo-tree").setup({
            close_if_last_window = true,
            popup_border_style = "rounded",
            filesystem = {
                hijack_netrw_behavior = "open_default",
            },
        })

        -- Keymaps
        vim.keymap.set("n", "<C-e>", "<cmd>Neotree toggle<CR>", { desc = "Open file [E]xplorer" })
    end,
}
