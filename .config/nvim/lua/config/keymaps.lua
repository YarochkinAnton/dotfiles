-- Exiting insert mode without Esc
vim.keymap.set("i", "ii", "<Esc>")
vim.keymap.set("i", "шш", "<Esc>")

-- Disable highlighting after search
-- vim.keymap.set('n', '<Leader>h', '<cmd>noh<CR>')

-- Line numbers
-- vim.keymap.set('n', '<Leader>n', '<cmd>set number!<CR><cmd>set relativenumber!<CR>')

-- Pane focus
-- vim.keymap.set('n', '<C-h>', '<cmd>wincmd h<CR>')
-- vim.keymap.set('n', '<C-j>', '<cmd>wincmd j<CR>')
-- vim.keymap.set('n', '<C-k>', '<cmd>wincmd k<CR>')
-- vim.keymap.set('n', '<C-l>', '<cmd>wincmd l<CR>')

-- Tab switching
vim.keymap.set("", "<Tab>", "gt")
vim.keymap.set("", "<S-Tab>", "gT")

-- System clipboard
-- vim.keymap.set("v", "<C-c>", '"+y')
-- vim.keymap.set("n", "<C-c>", '"+yy')
-- vim.keymap.set("i", "<C-v>", '<Esc>"+pi')
