return {
    "nvim-lualine/lualine.nvim",
    opts = function(_, opts)
        table.remove(opts.sections.lualine_c, 1)
        table.remove(opts.sections.lualine_c, 3)
        table.remove(opts.sections.lualine_c, 4)
        table.insert(opts.sections.lualine_c, 3, {
            "filename",
            path = 3,
        })
    end,
}
