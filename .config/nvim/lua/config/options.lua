vim.opt.confirm = false
vim.opt.guicursor = "i:ver25"
vim.opt.guifont = "Iosevka Term"
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.g.material_style = "deep ocean"

-- Next section is sourced from
-- https://github.com/Wansmer/langmapper.nvim/blob/3d5c9e8cf0186da8e2f04480cd84042ad6d2de29/README.md
local function escape(str)
    -- You need to escape these characters to work correctly
    local escape_chars = [[;,."|\]]
    return vim.fn.escape(str, escape_chars)
end

-- Recommended to use lua template string
local en = [[`qwertyuiop[]asdfghjkl;'zxcvbnm]]
local ru = [[ёйцукенгшщзхъфывапролджэячсмить]]
local en_shift = [[~QWERTYUIOP{}ASDFGHJKL:"ZXCVBNM<>]]
local ru_shift = [[ËЙЦУКЕНГШЩЗХЪФЫВАПРОЛДЖЭЯЧСМИТЬБЮ]]

vim.opt.langmap = vim.fn.join({
    -- | `to` should be first     | `from` should be second
    escape(ru_shift)
        .. ";"
        .. escape(en_shift),
    escape(ru) .. ";" .. escape(en),
}, ",")

vim.opt.spelllang = "ru,en"

vim.g.nord_bold = 1
vim.g.nord_italic_comments = 1
vim.g.nord_italic = 1
vim.g.nord_underline = 1
vim.g.nord_cursor_line_number_background = 1
