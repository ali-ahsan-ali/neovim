return {
    "neovim/nvim-lspconfig",
    config = function()
        local lspconfig = require("lspconfig")
        require 'lspconfig'.sourcekit.setup {
            capabilities = capabilities,
            on_attach = function(arg1, arg2)
                vim.keymap.set('n', '<leader>dp', require "xbase.pickers.builtin".actions, { desc = "XBase picker" })
                vim.keymap.set('n', '<leader>dl', function()
                    require "xbase.logger".toggle(false, true)
                    end, { desc = "XBase logger" })
                return on_attach(arg1, arg2)
            end,
            filetypes = { "swift" },
            root_dir = lspconfig.util.root_pattern("*.xcodeproj", "*.xcworkspace", "Package.swift", ".git", "project.yml", "Project.swift"),
            cmd = {
                "xcrun",
                "sourcekit-lsp",
                "--log-level",
                "debug"
            }
        }
    end
}


