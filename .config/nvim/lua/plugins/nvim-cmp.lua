return {
    "hrsh7th/nvim-cmp",
    keys = function()
        return {}
    end,
    opts = {
        window = {
            documentation = {
                border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
            },
            completion = {
                border = { "┌", "─", "┐", "│", "┘", "─", "└", "│" },
                winhighlight = "Normal:CmpPmenu,FloatBorder:CmpPmenuBorder,CursorLine:PmenuSel,Search:None",
            },
        },
    },
}
