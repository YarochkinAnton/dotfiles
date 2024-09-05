return {
    "zk-org/zk-nvim",
    opts = {
        -- can be "telescope", "fzf", "fzf_lua", "minipick", or "select" (`vim.ui.select`)
        -- it's recommended to use "telescope", "fzf", "fzf_lua", or "minipick"
        picker = "fzf_lua",

        lsp = {
            -- `config` is passed to `vim.lsp.start_client(config)`
            config = {
                cmd = { "zk", "lsp" },
                name = "zk",
                -- on_attach = ...
                -- etc, see `:h vim.lsp.start_client()`
            },

            -- automatically attach buffers in a zk notebook that match the given filetypes
            auto_attach = {
                enabled = true,
                filetypes = { "markdown" },
            },
        },
    },
    config = function(_, opts)
        require("zk").setup(opts)
        vim.api.nvim_set_keymap(
            "n",
            "<leader>zn",
            "<cmd>ZkNew { title = vim.fn.input('Title: ') }<cr>",
            { desc = "New regular note" }
        )
        vim.api.nvim_set_keymap(
            "n",
            "<leader>zdy",
            "<cmd>ZkNew { group = 'daily' }<cr>",
            { desc = "Open yesterday's daily note" }
        )
        vim.api.nvim_set_keymap(
            "n",
            "<leader>zdd",
            "<cmd>ZkNew { group = 'daily' }<cr>",
            { desc = "Open today's daily note" }
        )
        vim.api.nvim_set_keymap(
            "n",
            "<leader>zdt",
            "<cmd>ZkNew { group = 'daily' }<cr>",
            { desc = "Open tomorrow's daily note" }
        )
        vim.api.nvim_set_keymap(
            "n",
            "<leader>zm",
            "<cmd>ZkNew { group = 'meeting', title = vim.fn.input('Title: ') }<cr>",
            { desc = "New meeting brief" }
        )
        vim.api.nvim_set_keymap("n", "<leader>zl", "<cmd>ZkLinks<cr>", { desc = "Show link" })
        vim.api.nvim_set_keymap("n", "<leader>zb", "<cmd>ZkBacklinks<cr>", { desc = "Show backlings" })
        vim.api.nvim_set_keymap("n", "<leader>zil", "<cmd>ZkInsertLink<cr>", { desc = "Insert link" })
        vim.api.nvim_set_keymap(
            "v",
            "<leader>zil",
            "<cmd>'<,'>ZkInsertLinkAtSelection<cr>",
            { desc = "Insert link at seletion" }
        )
        vim.api.nvim_set_keymap("n", "<leader>zt", "<cmd>ZkTags<cr>", { desc = "Search tags" })
        vim.api.nvim_set_keymap("n", "<leader>zf", "<cmd>ZkNotes<cr>", { desc = "Search notes" })
        vim.api.nvim_set_keymap("v", "<leader>zm", "<cmd>'<,'>ZkMatch<cr>", { desc = "Search seletion in notes" })
    end,
}
