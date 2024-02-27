vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
	pattern = "*.bu",
	command = "set filetype=yaml",
})

vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
	pattern = { "*ansible.yaml" },
	command = "set filetype=yaml.ansible",
})

-- Disable autoformat for json files
vim.api.nvim_create_autocmd({ "FileType" }, {
	pattern = { "json" },
	callback = function()
		vim.b.autoformat = false
	end,
})
