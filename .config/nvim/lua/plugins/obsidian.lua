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
            o = {
                name = "obsidian",
                d = {
                    name = "daily",
                    t = { "<cmd>ObsidianToday<CR>", "Open today's daily note" },
                    p = { "<cmd>ObsidianYesterday<CR>", "Open yesterday's daily note" },
                    s = { "<cmd>ObsidianDailies<CR>", "Open dailies" },
                },
                l = { "<cmd>ObsidianLinks<CR>", "Show links" },
                L = { "<cmd>ObsidianBacklinks<CR>", "Show backlinks" },
            },
        }
        local wk = require("which-key")
        wk.register(keys, { prefix = "<leader>" })
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
