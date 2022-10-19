return require("packer").startup(function()
    -- Packer can manage itself
    use("wbthomason/packer.nvim")

    -- Visual enhancements
    use("itchyny/lightline.vim")
    use("morhetz/gruvbox")
    use("machakann/vim-highlightedyank")

    -- General
    use("tpope/vim-fugitive")

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
