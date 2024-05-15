return function(use)
  -- KICKSTART SETUP {{{
  -- Package manager
  use 'wbthomason/packer.nvim'

  use { -- LSP Configuration & e 
    'neovim/nvim-lspconfig',
    requires = {
      -- Automatically install LSPs to stdpath for neovim
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim',

      -- Useful status updates for LSP
      'j-hui/fidget.nvim',

      -- Additional lua configuration, makes nvim stuff amazing
      'folke/neodev.nvim',
    },
  }

  use { -- Autocompletion
    'hrsh7th/nvim-cmp',
    requires = {
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-cmdline',
      'L3MON4D3/LuaSnip',
      'saadparwaiz1/cmp_luasnip',
    },
  }

  use { -- Highlight, edit, and navigate code
    'nvim-treesitter/nvim-treesitter',
    run = function()
      pcall(require('nvim-treesitter.install').update { with_sync = true })
    end,
  }

  use { -- Additional text objects via treesitter
    'nvim-treesitter/nvim-treesitter-textobjects',
    after = 'nvim-treesitter',
  }

  vim.cmd([[ let g:neo_tree_remove_legacy_commands = 1 ]])

  -- Git related plugins
  use 'tpope/vim-fugitive'
  use 'tpope/vim-rhubarb'
  use 'lewis6991/gitsigns.nvim'

  -- Fancier statusline
  use 'nvim-lualine/lualine.nvim'

  use 'lukas-reineke/indent-blankline.nvim' -- Add indentation guides even on blank lines
  use 'numToStr/Comment.nvim' -- "gc" to comment visual regions/lines
  use 'tpope/vim-sleuth' -- Detect tabstop and shiftwidth automatically

  -- Fuzzy Finder (files, lsp, etc)
  use { 'nvim-telescope/telescope.nvim', branch = '0.1.x', requires = { 'nvim-lua/plenary.nvim' } }

  -- Fuzzy Finder Algorithm which requires local dependencies to be built. Only load if `make` is available
  use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
  use { 'nvim-telescope/telescope-fzy-native.nvim' }
  -- }}}

  -- Pretty colors
  use 'ellisonleao/gruvbox.nvim'

  use({ 'rose-pine/neovim', as = 'rose-pine' })

  -- Allow pane movement to jump out of vim into tmux
  use 'jgdavey/tslime.vim'
  use 'christoomey/vim-tmux-navigator'

  -- Surround with brackets easily
  use 'tpope/vim-surround'
  -- Repeat those surrounds properly with .
  use 'tpope/vim-repeat'

  -- Navigation
  use 'ggandor/leap.nvim'

  use 'tyru/open-browser.vim'
  use 'tyru/open-browser-github.vim'

  use {
    's1n7ax/nvim-window-picker',
    tag = 'v1.*'
  }

  use {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v2.x",
    requires = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
    }
  }

  use 'nvim-lua/completion-nvim'

  use 'neovimhaskell/haskell-vim'

  use {
    'windwp/nvim-autopairs',
    config = function() require("nvim-autopairs").setup {} end
  }

  -- Missing utf8 lua module
  use { 'uga-rosa/utf8.nvim' }

  -- Code scratchpad
  use({ 'metakirby5/codi.vim' })

  use 'github/copilot.vim'

  use '/home/bree/dev/blue-sentinel-nvim'

  use 'andymass/vim-matchup'

  use 'slim-template/vim-slim.git'
end
