-- Exiting insert mode without Esc
vim.keymap.set("i", "ii", "<Esc>")
vim.keymap.set("i", "шш", "<Esc>")

-- Tab switching
vim.keymap.set("", "<Tab>", "gt")
vim.keymap.set("", "<S-Tab>", "gT")
