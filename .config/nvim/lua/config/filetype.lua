vim.filetype.add({
    extension = { rasi = "rasi" },
    pattern = {
        [".*/waybar/config"] = "jsonc",
        [".*/mako/config"] = "dosini",
        [".*/hypr/.*%.conf"] = "hyprlang",
        [".*.gitlab-ci.yml"] = "yaml.gitlab",
        [".markdownlintrc"] = "json",
    },
})
