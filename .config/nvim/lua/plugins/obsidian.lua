return {
    "epwalsh/obsidian.nvim",
    version = "*", -- recommended, use latest release instead of latest commit
    lazy = true,

    ft = "markdown",
    -- Replace the above line with this if you only want to load obsidian.nvim for markdown files in your vault:
    -- event = {
    --   -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
    --   -- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/**.md"
    --   "BufReadPre path/to/my-vault/**.md",
    --   "BufNewFile path/to/my-vault/**.md",
    -- },
    dependencies = {
        "nvim-lua/plenary.nvim",
    },
    keys = function()
        local keys = {
            { "<leader>o", group = "obsidian" },
            { "<leader>oL", "<cmd>ObsidianBacklinks<CR>", desc = "Show backlinks" },
            { "<leader>od", group = "daily" },
            { "<leader>odp", "<cmd>ObsidianYesterday<CR>", desc = "Open yesterday's daily note" },
            { "<leader>ods", "<cmd>ObsidianDailies<CR>", desc = "Open dailies" },
            { "<leader>odt", "<cmd>ObsidianToday<CR>", desc = "Open today's daily note" },
            { "<leader>ol", "<cmd>ObsidianLinks<CR>", desc = "Show links" },
            { "<leader>ot", "<cmd>ObsidianToggleCheckbox<CR>", desc = "Toggle checkbox" },
        }

        local wk = require("which-key")
        wk.add(keys)
    end,
    opts = {
        workspaces = {
            {
                name = "mind-vault",
                path = "~/documents/mind-vault",
            },
        },
        daily_notes = {
            -- Optional, if you keep daily notes in a separate directory.
            folder = "daily",
            -- Optional, if you want to change the date format for the ID of daily notes.
            date_format = "%Y-%m-%d",
            -- Optional, if you want to change the date format of the default alias of daily notes.
            alias_format = "%B %-d, %Y",
            -- Optional, if you want to automatically insert a template from your template directory like 'daily.md'
            template = nil,
        },
        mappings = {},
    },
}
