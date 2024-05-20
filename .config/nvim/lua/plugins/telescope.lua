local actions_layout = require("telescope.actions.layout")

return {
    "nvim-telescope/telescope.nvim",
    lazy = false,
    dependencies = {
        {
            "nvim-telescope/telescope-file-browser.nvim",
            config = function(plugin)
                LazyVim.on_load("telescope.nvim", function()
                    pcall(require("telescope").load_extension, "file_browser")
                end)
            end,
        },
    },
    opts = {
        pickers = {
            find_files = {
                hidden = true,
            },
            live_grep = {
                glob_pattern = { "!**/.git/**" },
                additional_args = { "--hidden" },
            },
        },
        defaults = {
            file_ingore_patterns = { ".git/" },
            mappings = {
                n = {
                    ["p"] = actions_layout.toggle_preview,
                },
            },
            layout_strategy = "flex",
            layout_config = {
                flex = {
                    flip_columns = 150,
                },
                horizontal = {
                    preview_width = 0.6,
                },
            },
        },
        extensions = {
            file_browser = {
                -- theme = "ivy",
                -- disables netrw and use telescope-file-browser in its place
                hijack_netrw = true,
                mappings = {
                    i = {
                        -- your custom insert mode mappings
                    },
                    n = {
                        -- your custom normal mode mappings
                    },
                },
            },
        },
    },
    keys = {
        { "<leader>e", "<cmd>Telescope file_browser path=. hidden=true<CR>" },
    },
}
