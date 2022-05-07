require'nvim-treesitter.configs'.setup {
    ensure_installed = {
        -- Frontend
        "typescript",
        "tsx",
        "javascript",
        "json",
        "html",
        "css",
        "scss",

        -- General
        "markdown",
        "r",
        "latex",
        "python",
        "rust",
        "toml",
        "c_sharp",
        "lua",
        "vim",
        "yaml",
    },
    sync_install = false,

    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
    },
}
