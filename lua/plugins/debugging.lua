return {
    {
        "mfussenegger/nvim-dap",
        dependencies = { "rcarriga/nvim-dap-ui", "nvim-neotest/nvim-nio" },
        config = function()
            local dap, dapui = require("dap"), require("dapui")
            require("dapui").setup()
            dap.listeners.before.attach.dapui_config = function()
                dapui.open()
            end
            dap.listeners.before.launch.dapui_config = function()
                dapui.open()
            end
            dap.listeners.before.event_terminated.dapui_config = function()
                dapui.close()
            end
            dap.listeners.before.event_exited.dapui_config = function()
                dapui.close()
            end

            vim.keymap.set("n", "<Leader>dc", function()
                dap.continue()
            end, { desc = "[D]ebug [C]ontinue" })
            vim.keymap.set("n", "<Leader>dt", function()
                dap.toggle_breakpoint()
            end, { desc = "[D]ebug [T]oggle breakpoint" })
            vim.keymap.set("n", "<F10>", function()
                require("dap").step_over()
            end, { desc = "[S]tep [O]ver" })
            vim.keymap.set("n", "<F11>", function()
                require("dap").step_into()
            end, { desc = "[S]tep [I]nto" })
            vim.keymap.set("n", "<F12>", function()
                require("dap").step_out()
            end, { desc = "[S]tep [U]t" })
            vim.keymap.set("n", "<Leader>dB", function()
                require("dap").set_breakpoint()
            end, { desc = "[D]ebug [B]reakpoint" })
            vim.keymap.set("n", "<Leader>dr", function()
                require("dap").repl.open()
            end, { desc = "[D]ebug [R]EPL" })
            vim.keymap.set("n", "<Leader>dl", function()
                require("dap").run_last()
            end, { desc = "[D]ebug [L]ast run" })
            vim.keymap.set({ "n", "v" }, "<Leader>dh", function()
                require("dap.ui.widgets").hover()
            end, { desc = "[D]ebug [H]over" })
            vim.keymap.set({ "n", "v" }, "<Leader>dp", function()
                require("dap.ui.widgets").preview()
            end, { desc = "[D]ebug [P]review" })
            vim.keymap.set("n", "<Leader>df", function()
                local w = require("dap.ui.widgets")
                w.centered_float(w.frames)
            end, { desc = "[D]ebug [F]rames" })
            vim.keymap.set("n", "<Leader>ds", function()
                local w = require("dap.ui.widgets")
                w.centered_float(w.scopes)
            end, { desc = "[D]ebug [S]copes" })

            -- C/C++/RUST
            dap.adapters.lldb = {
                type = "executable",
                command = "/usr/bin/lldb-dap",
                name = "lldb",
            }

            dap.configurations.cpp = {
                {
                    name = "Launch",
                    type = "lldb",
                    request = "launch",
                    program = function()
                        return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
                    end,
                    cwd = "${workspaceFolder}",
                    stopOnEntry = false,
                    args = {},
                },
            }
            dap.configurations.c = dap.configurations.cpp

            dap.configurations.rust = {
                {
                    name = "Launch",
                    type = "lldb",
                    request = "launch",
                    program = function()
                        return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
                    end,
                    cwd = "${workspaceFolder}",
                    stopOnEntry = false,
                    args = {},

                    initCommands = function()
                        -- Find out where to look for the pretty printer Python module.
                        local rustc_sysroot = vim.fn.trim(vim.fn.system("rustc --print sysroot"))
                        assert(
                            vim.v.shell_error == 0,
                            "failed to get rust sysroot using `rustc --print sysroot`: " .. rustc_sysroot
                        )
                        local script_file = rustc_sysroot .. "/lib/rustlib/etc/lldb_lookup.py"
                        local commands_file = rustc_sysroot .. "/lib/rustlib/etc/lldb_commands"

                        -- The following is a table/list of lldb commands, which have a syntax
                        -- similar to shell commands.
                        --
                        -- To see which command options are supported, you can run these commands
                        -- in a shell:
                        --
                        --   * lldb --batch -o 'help command script import'
                        --   * lldb --batch -o 'help command source'
                        --
                        -- Commands prefixed with `?` are quiet on success (nothing is written to
                        -- debugger console if the command succeeds).
                        --
                        -- Prefixing a command with `!` enables error checking (if a command
                        -- prefixed with `!` fails, subsequent commands will not be run).
                        --
                        -- NOTE: it is possible to put these commands inside the ~/.lldbinit
                        -- config file instead, which would enable rust types globally for ALL
                        -- lldb sessions (i.e. including those run outside of nvim). However,
                        -- that may lead to conflicts when debugging other languages, as the type
                        -- formatters are merely regex-matched against type names. Also note that
                        -- .lldbinit doesn't support the `!` and `?` prefix shorthands.
                        return {
                            ([[!command script import '%s']]):format(script_file),
                            ([[command source '%s']]):format(commands_file),
                        }
                    end,
                },
            }
        end,
    },
    -- {
    --     "rcarriga/nvim-dap-ui",
    --     dependencies = { "nvim-neotest/nvim-nio" },
    --     config = function()
    --         require("dapui").setup()
    --     end,
    -- },
}
