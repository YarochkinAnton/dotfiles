return {
    "mrcjkb/rustaceanvim",
    version = "^4", -- Recommended
    ft = { "rust" },
    opts = {
        server = {
            on_attach = function(client, bufnr)
                -- register which-key mappings
                local wk = require("which-key")
                wk.register({
                    ["<leader>cR"] = {
                        function()
                            vim.cmd.RustLsp("codeAction")
                        end,
                        "Code Action",
                    },
                    ["<leader>dr"] = {
                        function()
                            vim.cmd.RustLsp("debuggables")
                        end,
                        "Rust debuggables",
                    },
                }, { mode = "n", buffer = bufnr })
            end,
            default_settings = {
                -- rust-analyzer language server configuration
                ["rust-analyzer"] = {
                    cargo = {
                        allFeatures = true,
                        loadOutDirsFromCheck = true,
                        runBuildScripts = true,
                    },
                    -- Add clippy lints for Rust.
                    checkOnSave = {
                        allFeatures = true,
                        command = "clippy",
                        extraArgs = { "--no-deps" },
                    },
                    procMacro = {
                        enable = true,
                        ignored = {
                            ["async-trait"] = { "async_trait" },
                            ["napi-derive"] = { "napi" },
                            ["async-recursion"] = { "async_recursion" },
                        },
                    },
                    inlayHints = {
                        enable = true,
                        typeHints = {
                            enable = true,
                        },
                        bindingModeHints = {
                            enable = true,
                        },
                        implicitDrops = {
                            enable = true,
                        },
                    },
                    completion = {
                        snippets = {
                            custom = {
                                mutex = {
                                    postfix = "mtx",
                                    body = "Mutex::new(${receiver})",
                                    description = "Wrap expression in Mutex::new",
                                    scope = "expr",
                                },
                                arc = {
                                    postfix = "arc",
                                    body = "Arc::new(${receiver})",
                                    requires = "std::sync::Arc",
                                    description = "Put the expression into an `Arc`",
                                    scope = "expr",
                                },
                                box = {
                                    postfix = "box",
                                    body = "box::new(${receiver})",
                                    description = "Put the expression into an `Arc`",
                                    scope = "expr",
                                },
                                rc = {
                                    postfix = "rc",
                                    body = "Rc::new(${receiver})",
                                    requires = "std::rc::Rc",
                                    description = "Put the expression into an `Rc`",
                                    scope = "expr",
                                },
                                box = {
                                    postfix = "pinbox",
                                    body = "Box::pin(${receiver})",
                                    requires = "std::boxed::Box",
                                    description = "Put the expression into a pinned `Box`",
                                    scope = "expr",
                                },
                                Ok = {
                                    postfix = "ok",
                                    body = "Ok(${receiver})",
                                    description = "Wrap the expression in a `Result::Ok`",
                                    scope = "expr",
                                },
                                Err = {
                                    postfix = "err",
                                    body = "Err(${receiver})",
                                    description = "Wrap the expression in a `Result::Err`",
                                    scope = "expr",
                                },
                                Some = {
                                    postfix = "some",
                                    body = "Some(${receiver})",
                                    description = "Wrap the expression in an `Option::Some`",
                                    scope = "expr",
                                },
                            },
                        },
                    },
                },
            },
        },
    },
    config = function(_, opts)
        vim.g.rustaceanvim = vim.tbl_deep_extend("force", {}, opts or {})
    end,
}
