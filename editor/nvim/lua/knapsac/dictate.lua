local configs = require "lspconfig.configs"
local util = require "lspconfig.util"

configs.dictate = {
    default_config = {
        cmd = { "I:/Dev/work/dictate/src/dictate/bin/Debug/net7.0/dictate.exe" },
        filetypes = { "mr" },
        root_dir = util.path.dirname,
    },
    docs = {
        description = "Language Server Protocol for Magma Dictate.",
        default_config = {
            root_dir = [[root_pattern(".git")]],
        },
    },
}

-- Colors
-- See: https://github.com/morhetz/gruvbox/blob/bf2885a95efdad7bd5e4794dd0213917770d79b7/colors/gruvbox.vim#L274
-- TODO CV: Use https://github.com/ellisonleao/gruvbox.nvim???
vim.api.nvim_set_hl(0, '@lsp.type.keyword.mr', { fg = vim.g.terminal_color_9 })
