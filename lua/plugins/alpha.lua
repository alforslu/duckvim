return {
    "goolord/alpha-nvim",
    dependencies = {
        "echasnovski/mini.icons",
        "nvim-lua/plenary.nvim",
    },
    config = function()
        local alpha = require("alpha")
        local dashboard = require("alpha.themes.dashboard")

        -- Set header
        dashboard.section.header.val = {
            "                                                        ",
            "██████╗░██╗░░░██╗░█████╗░██╗░░██╗██╗░░░██╗██╗███╗░░░███╗",
            "██╔══██╗██║░░░██║██╔══██╗██║░██╔╝██║░░░██║██║████╗░████║",
            "██║░░██║██║░░░██║██║░░╚═╝█████═╝░╚██╗░██╔╝██║██╔████╔██║",
            "██║░░██║██║░░░██║██║░░██╗██╔═██╗░░╚████╔╝░██║██║╚██╔╝██║",
            "██████╔╝╚██████╔╝╚█████╔╝██║░╚██╗░░╚██╔╝░░██║██║░╚═╝░██║",
            "╚═════╝░░╚═════╝░░╚════╝░╚═╝░░╚═╝░░░╚═╝░░░╚═╝╚═╝░░░░░╚═╝",
            "                                                        ",
        }

        -- Set menu
        dashboard.section.buttons.val = {
            dashboard.button("f", "  Find files", ":cd $HOME/Projects <CR> | :Telescope find_files<CR>"),
            dashboard.button("r", "󰄉  Recent files", ":Telescope oldfiles <CR>"),
            dashboard.button("u", "󱐥  Update plugins", "<cmd>Lazy update<CR>"),
            dashboard.button("s", "  Settings", ":cd $HOME/.config/nvim/ | :e $MYVIMRC | :Neotree<CR>"),
        }

        -- Send config to alpha
        alpha.setup(dashboard.opts)

        -- Disable folding on alpha buffer
        vim.cmd([[
            autocmd FileType alpha setlocal nofoldenable
        ]])
    end,
}
