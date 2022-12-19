local Remap = require("knapsac.keymap")
local nnoremap = Remap.nnoremap
local inoremap = Remap.inoremap

local sumneko_root_path = "I:/Utils/sumneko"
local sumneko_binary = sumneko_root_path .. "/bin/lua-language-server"

-- Setup nvim-cmp.
local cmp = require("cmp")
cmp.setup({
    mapping = cmp.mapping.preset.insert({
        ["<C-u>"] = cmp.mapping.scroll_docs(-4),
        ["<C-d>"] = cmp.mapping.scroll_docs(4),
        ["<CR>"] = cmp.mapping.confirm({ select = true }),
        ["<Tab>"] = function(fallback)
            if cmp.visible() then
                cmp.select_next_item({ select = true })
            else
                fallback()
            end
        end,
        ["<S-Tab>"] = function(fallback)
            if cmp.visible() then
                cmp.select_prev_item({ select = true })
            else
                fallback()
            end
        end,
    }),

    sources = {
        { name = "nvim_lsp" },
        { name = "buffer" },
    },
})

local function config(_config)
    return vim.tbl_deep_extend("force", {
        on_attach = function()
            nnoremap("gd", function() vim.lsp.buf.definition() end)
            nnoremap("K", function() vim.lsp.buf.hover() end)
            nnoremap("<leader>ws", function() vim.lsp.buf.workspace_symbol() end)
            nnoremap("<leader>d", function() vim.diagnostic.open_float() end)
            nnoremap("[d", function() vim.diagnostic.goto_next() end)
            nnoremap("]d", function() vim.diagnostic.goto_prev() end)
            nnoremap("<leader>a", function() vim.lsp.buf.code_action() end)
            nnoremap("<leader>gr", function() vim.lsp.buf.references() end)
            inoremap("<C-h>", function() vim.lsp.buf.signature_help() end)
        end,
    }, _config or {})
end

-- Typescript
require("lspconfig").tsserver.setup(config({
    capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())
}))

-- JSON
require("lspconfig").jsonls.setup(config())

-- HTML
require("lspconfig").html.setup(config())

-- C, C++ and variants
require("lspconfig").ccls.setup(config())

-- CSS
require("lspconfig").cssls.setup(config())

-- Rust
require("lspconfig").rust_analyzer.setup(config({
    cmd = { "rustup", "run", "beta", "rust-analyzer" },
}))

-- Lua
require("lspconfig").sumneko_lua.setup(config({
    cmd = { sumneko_binary, "-E", sumneko_root_path .. "/main.lua" },
    settings = {
        Lua = {
            runtime = {
                -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
                version = "LuaJIT",
                -- Setup your lua path
                path = vim.split(package.path, ";"),
            },
            diagnostics = {
                -- Get the language server to recognize the `vim` global
                globals = { "vim" },
            },
            workspace = {
                -- Make the server aware of Neovim runtime files
                library = {
                    [vim.fn.expand("$VIMRUNTIME/lua")] = true,
                    [vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true,
                },
            },
        },
    },
}))

require("formatter").setup {
    logging = true,
    log_level = vim.log.levels.WARN,
    filetype = {
        lua = { require("formatter.filetypes.lua").stylua },
        markdown = { require("formatter.filetypes.markdown").prettier },
        html = { require("formatter.filetypes.html").prettier },
        json = { require("formatter.filetypes.json").prettier },
        javascript = { require("formatter.filetypes.javascript").prettier },
        javascriptreact = { require("formatter.filetypes.javascriptreact").prettier },
        typescript = { require("formatter.filetypes.typescript").prettier },
        typescriptreact = { require("formatter.filetypes.typescriptreact").prettier },
        rust = { require("formatter.filetypes.rust").rustfmt },
    }
}
