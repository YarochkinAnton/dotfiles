return {
    "folke/zen-mode.nvim",
    opts = {
        window = {
            width = 120,
            height = 0.8,
        },
        plugins = {
            options = {
                enabled = true,
                showcmd = false,
                laststatus = 3,
            },
        },
    },
    keys = {
        { "<leader>uz", "<cmd>ZenMode<cr>", desc = "Toggle zen mode" },
    },
}
