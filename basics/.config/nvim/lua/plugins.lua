vim.cmd [[packadd packer.nvim]]

return require("packer").startup(function(use)
  use "wbthomason/packer.nvim"
  use "tpope/vim-sensible"
  use "editorconfig/editorconfig-vim"
  use "SirVer/ultisnips"
  use "honza/vim-snippets"
  use "Ivo-Donchev/vim-react-goto-definition"
  use "tpope/vim-surround"
  use "mattn/emmet-vim"
  use "godlygeek/tabular"
  use "tpope/vim-vinegar"
  use "kshenoy/vim-signature"

  use "hashivim/vim-terraform"
  use "styled-components/vim-styled-components"
  use "chrisbra/Colorizer"
  use "hail2u/vim-css3-syntax"
  use "iCyMind/NeoSolarized"
  use "pangloss/vim-javascript"
  use "maxmellon/vim-jsx-pretty"
  use "gregsexton/matchtag"

  use {
    'nvim-telescope/telescope.nvim',
    requires = {
      'nvim-lua/plenary.nvim',
      'sharkdp/fd',
    },
  }

  -- syntax highlighting
  use "ishan9299/nvim-solarized-lua"
  use {
    "nvim-treesitter/nvim-treesitter",
    run = {":TSUpdate"},
  }

  -- go plugins
  -- use "fatih/vim-go"
  use { 
    "ray-x/go.nvim",
    requires = {
      "neovim/nvim-lspconfig",
      "nvim-treesitter/nvim-treesitter",
      "mfussenegger/nvim-dap",
      "rcarriga/nvim-dap-ui",
      "theHamsta/nvim-dap-virtual-text",
      "ray-x/guihua.lua",
    },
    run = {":TSInstall go", ":GoInstallBinaries"},
  }
  use "meain/vim-jsontogo"

  use "preservim/tagbar"
  use "ludovicchabant/vim-gutentags"
  use "sebdah/vim-delve"
  use "sheerun/vim-polyglot"
  use "tpope/vim-fugitive"
  use "airblade/vim-gitgutter"
end)

