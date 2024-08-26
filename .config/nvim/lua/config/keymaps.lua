-- Exiting insert mode without Esc
-- vim.keymap.set("i", "ii", "<Esc>", { silent = true, desc = "which_key_ignore" })
-- vim.keymap.set("i", "шш", "<Esc>")

-- Tab switching
vim.keymap.set("", "<Tab>", "gt")
vim.keymap.set("", "<S-Tab>", "gT")

-- Enter colon with double-tap semicolon
vim.keymap.set("n", ";;", ":", { desc = "which_key_ignore" })

-- Search in my dotfiles
vim.keymap.set("n", "<leader>fdf", function()
    local dotfiles_dir = os.getenv("DOTFILES")
    if nil == dotfiles_dir then
        ---@diagnostic disable-next-line: missing-fields
        require("notify").notify("DOTFILES environment variable is not set", "error", {
            title = " Dotfile search FAILED",
        })
    else
        require("telescope.builtin").git_files({
            cwd = dotfiles_dir,
        })
    end
end, { desc = "Find Dotfile" })

vim.keymap.set("n", "<leader>fdg", function()
    local dotfiles_dir = os.getenv("DOTFILES")
    if nil == dotfiles_dir then
        ---@diagnostic disable-next-line: missing-fields
        require("notify").notify("DOTFILES environment variable is not set", "error", {
            title = " Dotfile search FAILED",
        })
    else
        require("telescope.builtin").live_grep({
            cwd = dotfiles_dir,
        })
    end
end, { desc = "Grep Dotfiles" })

-- Stops neovim from overwriting paste register after pasting over selected text
vim.keymap.set("v", "p", '"_dP')

-- Cyrillic mapings
vim.keymap.set("c", "ц", "w")
vim.keymap.set("c", "й", "q")
