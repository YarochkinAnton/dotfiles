return {
    "folke/which-key.nvim",
    enabled = true,
    dependencies = { "Wansmer/langmapper.nvim" },
    config = function()
        vim.o.timeout = true
        vim.o.timeoutlen = 300

        local lmu = require("langmapper.utils")
        local view = require("which-key.view")
        local execute = view.execute

        -- wrap `execute()` and translate sequence back
        view.execute = function(prefix_i, mode, buf)
            -- Translate back to English characters
            prefix_i = lmu.translate_keycode(prefix_i, "default", "ru")
            execute(prefix_i, mode, buf)
        end

        require("which-key").setup()
    end,
}
