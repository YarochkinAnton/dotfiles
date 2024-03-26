return {
    "neovim/nvim-lspconfig",
    opts = {
        inlay_hints = {
            enabled = true,
        },
        servers = {
            terraformls = {
                mason = false, -- this is required due to not being able to download this language server
            },
            lua_ls = {
                Lua = {
                    hint = {
                        enable = true,
                    },
                },
            },
        },
    },
}
