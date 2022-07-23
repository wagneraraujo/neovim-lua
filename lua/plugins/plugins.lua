
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function()
  use 'wbthomason/packer.nvim'
  use 'terroo/vim-simple-emoji'
  use 'navarasu/onedark.nvim'
use {
  'nvim-telescope/telescope.nvim',
  requires = { {'nvim-lua/plenary.nvim'} }
}

use 'kyazdani42/nvim-web-devicons'
--use 'tamton-aquib/staline.nvim'
use 'lukas-reineke/indent-blankline.nvim'
use 'norcalli/nvim-colorizer.lua'
use 'tpope/vim-surround'
use 'windwp/nvim-autopairs'
use 'neovim/nvim-lspconfig'
use 'hrsh7th/nvim-cmp'
use 'hrsh7th/cmp-nvim-lsp'
use 'hrsh7th/cmp-buffer'
use 'hrsh7th/cmp-path'
use 'hrsh7th/cmp-cmdline'
use 'saadparwaiz1/cmp_luasnip'
use 'L3MON4D3/LuaSnip'
use 'rafamadriz/friendly-snippets'
use 'ray-x/lsp_signature.nvim'
use {'tzachar/cmp-tabnine', run='./install.sh', requires = 'hrsh7th/nvim-cmp'}
use 'onsails/lspkind-nvim'
use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }


use 'tpope/vim-fugitive'
use 'lewis6991/gitsigns.nvim'

  -- Navigation
use 'justinmk/vim-sneak'
use 'akinsho/bufferline.nvim'
  -- Dashboard
use { 'glepnir/dashboard-nvim'}


use {
  'kyazdani42/nvim-tree.lua',
  tag = 'nightly' -- optional, updated every week. (see issue #1193)
}

use {
  'nvim-lualine/lualine.nvim'}


use 'yamatsum/nvim-cursorline'
use 'dense-analysis/ale'

use 'wakatime/vim-wakatime'
--config for react
use 'mattn/emmet-vim'
use 'AndrewRadev/tagalong.vim'
use 'sbdchd/neoformat'
use 'alvan/vim-closetag'
use 'leafOfTree/vim-matchtag'
use 'JoosepAlviste/nvim-ts-context-commentstring'
use {'kristijanhusak/vim-js-file-import', run ='npm install'}

use{ 'anuvyklack/pretty-fold.nvim',
   config = function()
      require('pretty-fold').setup()
   end
}

use 'windwp/nvim-ts-autotag'
use 'marko-cerovac/material.nvim'

use {
    'numToStr/Comment.nvim',
    config = function()
        require('Comment').setup()
    end
}

use 'ludovicchabant/vim-gutentags'

end)


