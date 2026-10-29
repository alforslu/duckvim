return {
    "smart-splits-nvim/smart-splits.nvim",
    -- build = "./kitty/install-kittens.bash",
    dependencies = {
        {
            "smart-splits-nvim/backend-kitty",
            main = "smart-splits-backend-kitty",
            opts = {},
        },
    },

    config = function(_, opts)
        local smart_splits = require("smart-splits")
        smart_splits.setup(opts)

        -- Moving between splits
        vim.keymap.set("n", "<C-h>", smart_splits.move_cursor_left, { desc = "Move to split left", silent = true })
        vim.keymap.set("n", "<C-j>", smart_splits.move_cursor_down, { desc = "Move to split down", silent = true })
        vim.keymap.set("n", "<C-k>", smart_splits.move_cursor_up, { desc = "Move to split up", silent = true })
        vim.keymap.set("n", "<C-l>", smart_splits.move_cursor_right, { desc = "Move to split right", silent = true })

        -- Resizing splits with Ctrl + Arrow keys
        vim.keymap.set("n", "<C-Up>", smart_splits.resize_up, { desc = "Resize split up", silent = true })
        vim.keymap.set("n", "<C-Down>", smart_splits.resize_down, { desc = "Resize split down", silent = true })
        vim.keymap.set("n", "<C-Left>", smart_splits.resize_left, { desc = "Resize split left", silent = true })
        vim.keymap.set("n", "<C-Right>", smart_splits.resize_right, { desc = "Resize split right", silent = true })
    end,
}
