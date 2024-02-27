return {
    'xbase-lab/xbase',
    run = 'make install', -- or "make install && make free_space" (not recommended, longer build time)
    requires = {
        "neovim/nvim-lspconfig",
        -- "nvim-telescoplenarype/telescope.nvim", -- optional
        -- "nvim-lua/.nvim", -- optional/requirement of telescope.nvim
    },
    config = function()
        require 'xbase'.setup(
        -- NOTE: Defaults
            {
                --- Log level. Set it to ERROR to ignore everything
                log_level = vim.log.levels.DEBUG,
                --- Options to be passed to lspconfig.nvim's sourcekit setup function.
                --- Setting this to {} is sufficient, However, it is strongly recommended to use on_attach key to setup custom mappings
                -- - {
                -- - cmd = { "sourcekit-lsp", "--log-level", "error" },
                -- - filetypes = { "swift" },
                -- - root_dir = pattern("Package.swift", ".git", "project.yml", "Project.swift"),
                -- - }
                --- Statusline provider configurations
                statusline = {
                    watching = { icon = "", color = "#1abc9c" },
                    device_running = { icon = "", color = "#4a6edb" },
                    success = { icon = "", color = "#1abc9c" },
                    failure = { icon = "", color = "#db4b4b" },
                },
                --- Simulators to only include.
                --- run `xcrun simctl list` to get a full list of available simulator
                --- If the list is empty then all simulator available  will be included
                simctl = {
                    iOS = {
                        -- "iPhone 13 Pro", --- only use this devices
                    },
                    watchOS = {}, -- all available devices
                    tvOS = {}, -- all available devices
                },
                --- Log buffer configurations
                log_buffer = {
                    --- Whether toggling the buffer should auto focus to it?
                    focus = true,
                    --- Split Log buffer height
                    height = 20,
                    --- Vsplit Log buffer width
                    width = 75,
                    --- Default log buffer direction: { "horizontal", "vertical" }
                    default_direction = "horizontal",
                },
                --- Mappings
                mappings = {
                    --- Whether xbase mapping should be disabled.
                    enable = true,
                    --- Open build picker. showing targets and configuration.
                    build_picker = "<localleader>bb", --- set to 0 to disable
                    --- Open run picker. showing targets, devices and configuration
                    run_picker = "<localleader>br", --- set to 0 to disable
                    --- Open watch picker. showing run or build, targets, devices and configuration
                    watch_picker = "<localleader>bx", --- set to 0 to disable
                    --- A list of all the previous pickers
                    all_picker = "<localleader>bf", --- set to 0 to disable
                    --- horizontal toggle log buffer
                    toggle_split_log_buffer = "<localleader>l"
                },
            }
        )
    end
}
