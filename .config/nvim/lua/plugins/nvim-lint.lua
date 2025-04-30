return {
    {
        "mfussenegger/nvim-lint",
        opts = {
            linters_by_ft = {
                markdown = { "markdownlint" },
            },
            linters = {
                sqlfluff = {
                    args = {
                        "lint",
                        "--format=json",
                        -- note: users will have to replace the --dialect argument accordingly
                        "--dialect=postgres",
                    },
                },
            },
        },
    },
}
