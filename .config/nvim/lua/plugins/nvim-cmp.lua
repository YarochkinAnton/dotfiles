return {
    "hrsh7th/nvim-cmp",
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
