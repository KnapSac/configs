require'nvim-treesitter.configs'.setup {
    ensure_installed = {
        -- Frontend
        'typescript',
        'tsx',
        'javascript',
        'json',
        'html',
        'css',
        'scss',

        -- General
        'help',
        'markdown',
        'r',
        'latex',
        'rust',
        'toml',
        'c_sharp',
        'lua',
        'vim',
        'yaml',
        'proto',
    },

    sync_install = false,
    auto_install = true,

    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
    },
}
