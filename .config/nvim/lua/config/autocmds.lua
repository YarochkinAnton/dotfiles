-- au BufRead,BufNewFile *.bu set filetype=yaml

vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
    pattern = "*.bu",
    command = "set filetype=yaml"
})
