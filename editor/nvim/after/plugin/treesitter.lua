local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
parser_config.dictate = {
    install_info = {
        url = "I:/Dev/work/dictate/tree-sitter-dictate",
        files = { "src/parser.c" },
        generate_requires_npm = false,
    },
    filetype = "mr"
}

require 'nvim-treesitter.configs'.setup {
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
