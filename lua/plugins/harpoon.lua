return {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
        local harpoon = require("harpoon")
        harpoon.setup({})

        -- Keymaps
        vim.keymap.set("n", "<leader>ha", function()
            harpoon:list():add()
        end, { desc = "Add to harpoon" })
        vim.keymap.set("n", "<leader>hs", function()
            harpoon.ui:toggle_quick_menu(harpoon:list())
        end, { desc = "Show harpoon window" })

        vim.keymap.set("n", "<A-1>", function()
            harpoon:list():select(1)
        end, { desc = "Open harpoon buffer 1" })
        vim.keymap.set("n", "<A-2>", function()
            harpoon:list():select(2)
        end, { desc = "Open harpoon buffer 2" })
        vim.keymap.set("n", "<A-3>", function()
            harpoon:list():select(3)
        end, { desc = "Open harpoon buffer 3" })
        vim.keymap.set("n", "<A-4>", function()
            harpoon:list():select(4)
        end, { desc = "Open harpoon buffer 4" })

        -- Toggle previous & next buffers stored within Harpoon list
        -- vim.keymap.set("n", "<C-S-P>", function()
        --     harpoon:list():prev()
        -- end, { desc = "Open previous harpoon buffer" })
        -- vim.keymap.set("n", "<C-S-N>", function()
        --     harpoon:list():next()
        -- end, { desc = "Open next harpoon buffer" })
    end,
}
