call plug#begin('~/.config/nvim/plugged')

" Support bundles
Plug 'jgdavey/tslime.vim'
Plug 'Shougo/vimproc.vim', { 'do': 'make' }
Plug 'ervandew/supertab'
Plug 'benekastah/neomake'
Plug 'moll/vim-bbye'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'vim-scripts/gitignore'

" Git
Plug 'tpope/vim-fugitive'
Plug 'int3/vim-extradite'

" Bars, panels, and files
Plug 'scrooloose/nerdtree'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'mileszs/ack.vim'
Plug 'majutsushi/tagbar'

" Text manipulation
Plug 'jlanzarotta/bufexplorer'
Plug 'vim-scripts/Align'
Plug 'simnalamburt/vim-mundo'
Plug 'tpope/vim-commentary'
Plug 'godlygeek/tabular'
Plug 'michaeljsmith/vim-indent-object'
Plug 'easymotion/vim-easymotion'
Plug 'ConradIrwin/vim-bracketed-paste'
Plug 'scrooloose/nerdcommenter'
Plug 'tpope/tpope-vim-abolish'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'Raimondi/delimitMate'

" Allow pane movement to jump out of vim into tmux
Plug 'christoomey/vim-tmux-navigator'

" Filetype-specific
Plug 'prettier/vim-prettier'
Plug 'neovimhaskell/haskell-vim', { 'for': 'haskell' }
Plug 'eagletmt/ghcmod-vim', { 'for': 'haskell' }
Plug 'eagletmt/neco-ghc', { 'for': 'haskell' }
Plug 'Twinside/vim-hoogle', { 'for': 'haskell' }
Plug 'mpickering/hlint-refactor-vim', { 'for': 'haskell' }
Plug 'parsonsmatt/intero-neovim'

" Colorscheme
Plug 'vim-scripts/wombat256.vim'
Plug 'NLKNguyen/papercolor-theme'
Plug 'leafgarland/typescript-vim'
Plug 'tpope/vim-haml'
Plug 'chrisbra/Colorizer'

" Filetypes
Plug 'othree/xml.vim'
Plug 'mxw/vim-jsx'
Plug 'neoclide/vim-jsx-improve'
Plug 'pangloss/vim-javascript'
Plug 'mustache/vim-mustache-handlebars'

" Misc
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'fidian/hexmode'
Plug 'w0rp/ale'

call plug#end()
