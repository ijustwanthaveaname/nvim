return require('packer').startup(function()
  use {'akinsho/bufferline.nvim', requires = 'kyazdani42/nvim-web-devicons'}
  use 'wbthomason/packer.nvim'
  use {'neovim/nvim-lspconfig', 'williamboman/nvim-lsp-installer'}
  -- Packer can manage itself
  use {'glepnir/zephyr-nvim',
  requires = { 'nvim-treesitter/nvim-treesitter', opt = true }}
  use {
        'kyazdani42/nvim-tree.lua',
        requires = 'kyazdani42/nvim-web-devicons'
    }
  use {
  'nvim-lualine/lualine.nvim',
  requires = { 'kyazdani42/nvim-web-devicons', opt = true }
    }
-- lspconfig
--  use {'neovim/nvim-lspconfig', 'williamboman/nvim-lsp-installer'}
end)
