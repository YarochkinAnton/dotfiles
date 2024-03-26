return {
    {
        "akinsho/toggleterm.nvim",
        config = true,
        cmd = "ToggleTerm",
        keys = {
            { "<Leader>tv", "<cmd>ToggleTerm direction=vertical<cr>", desc = "Toggle terminal (vertical)" },
            { "<Leader>th", "<cmd>ToggleTerm direction=horizontal<cr>", desc = "Toggle terminal (horizontal)" },
            { "<Leader>tf", "<cmd>ToggleTerm direction=float<cr>", desc = "Toggle terminal (float)" },
        },
        opts = {
            open_mapping = [[<Leader>tt]],
            direction = "vertical",
            shade_filetypes = {},
            hide_numbers = true,
            terminal_mappings = true,
            insert_mappings = false,
            start_in_insert = true,
            close_on_exit = true,
            size = function(term)
                if term.direction == "horizontal" then
                    return 15
                elseif term.direction == "vertical" then
                    return vim.o.columns * 0.5
                end
            end,
        },
    },
}
