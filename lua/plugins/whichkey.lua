return {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {
        spec = {
            { "<leader>c", group = "[C]ode", mode = { "n", "x" } },
            { "<leader>d", group = "[D]ocument" },
            { "<leader>r", group = "[R]ename" },
            { "<leader>f", group = "[F]ind" },
            { "<leader>w", group = "[W]orkspace" },
            { "<leader>t", group = "[T]oggle" },
            { "<leader>h", group = "Git [H]unk", mode = { "n", "v" } },
        },
    },
    keys = {
        {
            "<leader>?",
            function()
                require("which-key").show({ global = false })

                local wk = require("which-key")
                wk.register({})
            end,
            desc = "Buffer Local Keymaps (which-key)",
        },
    },
}
