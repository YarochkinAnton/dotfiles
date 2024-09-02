return {
    "daenikon/marknav.nvim",
    enabled = false,
    ft = { "markdown", "md" },
    config = function()
        require("marknav").setup()
    end,
}
