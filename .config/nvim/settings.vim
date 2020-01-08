set list
" But only interesting whitespace
if &listchars ==# 'eol:$'
  set listchars=tab:⇥⇥,extends:⇉,precedes:⇇,trail:·,nbsp:·
endif
" Height of the command bar
set cmdheight=1
" Don't redraw while executing macros (good performance config)
set lazyredraw
" Ignore case when searching
set ignorecase
" When searching try to be smart about cases
set smartcase
" Highlight search results
set hlsearch
" Makes search act like search in modern browsers
set incsearch

" Use spaces instead of tabs
set expandtab

" 1 tab == 2 spaces, unless the file is already
" using tabs, in which case tabs will be inserted.
set shiftwidth=2
set softtabstop=2
set tabstop=2
set ai "Auto indent
set si "Smart indent

set wildignorecase
set wildmode=list:longest,full
set wildmenu
set backspace=eol,start,indent
set undofile

if !isdirectory($HOME."/tmp/vimundo")
    call mkdir($HOME."/tmp/vimundo", "p")
endif
set undodir=$HOME/tmp/vimundo//

if !isdirectory($HOME."/tmp/vimbackup")
    call mkdir($HOME."/tmp/vimbackup", "p")
endif
set backupdir=$HOME/tmp/vimbackup//

if !isdirectory("$HOME./tmp/vimswap")
    call mkdir($HOME."/tmp/vimswap", "p")
endif
set directory=$HOME/tmp/vimswap//

" Split in the more natural way
set splitright
set splitbelow

set nowrap
set textwidth=80
set cursorline
set virtualedit=block

" Use indentation for folds
set foldmethod=indent
set foldnestmax=5
set foldlevelstart=99
set foldcolumn=0

set number

" Set to auto read when a file is changed from the outside
set autoread

" Mouse in normal mode only, since I only use it for scrolling.
set mouse=n

augroup vimrcFold
  " fold vimrc itself by categories
  autocmd!
  autocmd FileType vim set foldmethod=marker
  autocmd FileType vim set foldlevel=0
augroup END

" Sets how many lines of history VIM has to remember
set history=700

" Stop the horrible 'existing swap file!' warnings
set shortmess+=A
