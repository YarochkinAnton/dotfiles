local actions_layout = require("telescope.actions.layout")

return {
    "nvim-telescope/telescope.nvim",
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
    },
}
