return {
	"neovim/nvim-lspconfig",
	opts = {
		servers = {
			terraformls = {
				mason = false, -- this is required due to not being able to download this language server
			},
		},
	},
}
