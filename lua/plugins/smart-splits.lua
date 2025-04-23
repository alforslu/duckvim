return {
    "mrjones2014/smart-splits.nvim",
    build = "./kitty/install-kittens.bash",
    config = function()
        require("smart-splits").setup()
        -- Smart Splits Keymaps
        local smart_splits = require("smart-splits")

        -- Moving between splits
        vim.keymap.set(
            "n",
            "<C-h>",
            smart_splits.move_cursor_left,
            { desc = "Move to split left", silent = true, noremap = true }
        )
        vim.keymap.set(
            "n",
            "<C-j>",
            smart_splits.move_cursor_down,
            { desc = "Move to split down", silent = true, noremap = true }
        )
        vim.keymap.set(
            "n",
            "<C-k>",
            smart_splits.move_cursor_up,
            { desc = "Move to split up", silent = true, noremap = true }
        )
        vim.keymap.set(
            "n",
            "<C-l>",
            smart_splits.move_cursor_right,
            { desc = "Move to split right", silent = true, noremap = true }
        )

        -- Resizing splits with Ctrl + Arrow keys
        vim.keymap.set(
            "n",
            "<C-Up>",
            smart_splits.resize_up,
            { desc = "Resize split up", silent = true, noremap = true }
        )
        vim.keymap.set(
            "n",
            "<C-Down>",
            smart_splits.resize_down,
            { desc = "Resize split down", silent = true, noremap = true }
        )
        vim.keymap.set(
            "n",
            "<C-Left>",
            smart_splits.resize_left,
            { desc = "Resize split left", silent = true, noremap = true }
        )
        vim.keymap.set(
            "n",
            "<C-Right>",
            smart_splits.resize_right,
            { desc = "Resize split right", silent = true, noremap = true }
        )
    end,
}
