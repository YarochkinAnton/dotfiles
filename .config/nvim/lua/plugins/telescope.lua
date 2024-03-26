return {
    "nvim-telescope/telescope.nvim",
    opts = {
        pickers = {
            find_files = {
                hidden = true,
            },
            grep_string = {
                additional_args = { "--hidden" },
            },
            live_grep = {
                additional_args = { "--hidden", "--glob", "!**/.git/**" },
            },
        },
    },
}
