return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    lazy = false,
    branch = "main",
    config = function()
        require("nvim-treesitter").install({

            -- Systems / low-level / compiled
            "c",
            "cpp",
            "rust",
            "zig",
            "nasm",
            "asm",
            "cuda",

            -- Graphics / shader languages
            "glsl",
            "wgsl",
            "hlsl",

            -- Scripting / automation / shell
            "bash",
            "zsh",
            "fish",
            "python",
            "perl",

            -- Build systems
            "cmake",
            "make",
            "ninja",

            -- Web / frontend
            "javascript",
            "typescript",
            "html",
            "css",

            -- Config / data formats
            "json",
            "jsonc",
            "yaml",
            "toml",
            "ini",
            "csv",

            -- Terminals / desktop configs
            "kitty",
            "hyprlang",
            "dockerfile",

            -- Query / databases
            "sql",

            -- LaTeX / Markdown / docs
            "latex",
            "markdown",
            "markdown_inline",

            -- Neovim / Lua ecosystem
            "lua",
            "vim",
            "vimdoc",
            "query",
        })
        -- local config = require("nvim-treesitter.configs")
        -- config.setup({
        --     auto_install = true,
        --     highlight = { enable = true },
        --     indent = { enable = true },
        -- })
    end,
}
