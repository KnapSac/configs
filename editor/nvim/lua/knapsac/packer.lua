return require("packer").startup(function(use)
    -- Packer can manage itself
    use("wbthomason/packer.nvim")

    -- Visual enhancements
    use("nvim-lualine/lualine.nvim")
    use("morhetz/gruvbox")
    use("machakann/vim-highlightedyank")

    -- General
    use("tpope/vim-fugitive")
    use("neovim/nvim-lspconfig")
    use("hrsh7th/cmp-nvim-lsp")
    use("hrsh7th/cmp-buffer")
    use("hrsh7th/nvim-cmp")
    use("j-hui/fidget.nvim")
    use("mhartington/formatter.nvim")

    -- Treesitter
    use("nvim-treesitter/nvim-treesitter", {
        run = ":TSUpdate"
    })

    -- Telescope
    use {
        "nvim-telescope/telescope.nvim", tag = "0.1.0",
        requires = { { "nvim-lua/plenary.nvim" } }
    }
    use("nvim-telescope/telescope-fzy-native.nvim")
end)
