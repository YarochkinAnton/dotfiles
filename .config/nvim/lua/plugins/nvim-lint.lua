return {
    {
        "mfussenegger/nvim-lint",
        opts = {
            linters = {
                markdownlint = {
                    args = { "--config", "~/.config/markdownlint.json", "--" },
                },
            },
            linters_by_ft = {
                markdown = { "markdownlint" },
            },
        },
    },
}
