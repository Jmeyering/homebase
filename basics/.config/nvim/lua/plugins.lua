vim.cmd [[packadd packer.nvim]]

return require("packer").startup(function(use)
  -- basic configuration
  use "wbthomason/packer.nvim"
  use "tpope/vim-sensible"
  use "editorconfig/editorconfig-vim"
  use "tpope/vim-vinegar"

  use {
    "kylechui/nvim-surround",
    config = function()
      require("nvim-surround").setup()
    end
  }
  use "mattn/emmet-vim"
  use "kshenoy/vim-signature"

  -- lsp code servers and config
  use {
    "ray-x/go.nvim",
    requires = {
      "neovim/nvim-lspconfig",
      "mfussenegger/nvim-dap",
      "rcarriga/nvim-dap-ui",
      "theHamsta/nvim-dap-virtual-text",
      "ray-x/guihua.lua",
    },
    run = { ":GoInstallBinaries" },
  }

  -- helpers
  use {
    "nvim-telescope/telescope.nvim",
    requires = {
      "nvim-lua/plenary.nvim",
      "sharkdp/fd",
    },
  }


  -- syntax highlighting
  use "ishan9299/nvim-solarized-lua"
  use {
    "nvim-treesitter/nvim-treesitter",
    run = { ":TSInstall go gomod json yaml javascript lua", ":TSUpdate" },
    config = function()
      require "nvim-treesitter.configs".setup {
        ensure_installed = { "go", "gomod", "yaml", "json", "javascript", "lua" },
        sync_install = false,
        auto_install = true,
        highlight = {
          enable = true,
        },
      }
    end
  }

  -- Snippets setup
  use {
    "hrsh7th/nvim-cmp",
    requires = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-cmdline",
      "saadparwaiz1/cmp_luasnip",
      "L3MON4D3/LuaSnip",
      "rafamadriz/friendly-snippets"
    },
    config = function()
      require('luasnip.loaders.from_vscode').lazy_load()
    end
  }

  use "meain/vim-jsontogo"
  use "preservim/tagbar"
  use "ludovicchabant/vim-gutentags"
  use "tpope/vim-fugitive"
  use "airblade/vim-gitgutter"
end)
