return function(use)
  -- Pretty colors
  use 'ellisonleao/gruvbox.nvim'

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
end
