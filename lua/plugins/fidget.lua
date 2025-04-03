return {
    "j-hui/fidget.nvim",
    opts = {
        progress = {
            ignore = {
                function(msg)
                    return msg.lsp_client.name == "pylsp" and string.find(msg.title, "lint:")
                end,
            },
        },
    },
    config = function(_, opts)
        require("fidget").setup(opts)
    end,
}
