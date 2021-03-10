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

" why
" https://stackoverflow.com/questions/44251106/tabbing-in-deoplete-is-backward
let g:SuperTabDefaultCompletionType = "<c-n>"

let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_guide_size = 1
let g:indent_guides_start_level = 2

if !isdirectory($HOME."/tmp/vim/undo")
    call mkdir($HOME."/tmp/vim/undo", "p")
endif
set undodir=$HOME/tmp/vim/undo//

if !isdirectory($HOME."/tmp/vim/backup")
    call mkdir($HOME."/tmp/vim/backup", "p")
endif
set backupdir=$HOME/tmp/vim/backup//

if !isdirectory($HOME."/tmp/vim/swap")
    call mkdir($HOME."/tmp/vim/swap", "p")
endif
set directory=$HOME/tmp/vim/swap//

" Tell vim to remember certain things when we exit
"  '10  :  marks will be remembered for up to 10 previously edited files
"  "100 :  will save up to 100 lines for each register
"  :20  :  up to 20 lines of command-line history will be remembered
"  %    :  saves and restores the buffer list
set viminfo='10,\"100,:20,%

" Move to previous mark on reopen
autocmd BufReadPost * if @% !~# '\.git[\/\\]COMMIT_EDITMSG$' && line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif

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

" Use Unix as the standard file type
set ffs=unix,dos,mac

set statusline=%f\ %m\ %h\ %r\ %q%=C%-3c%4l/%-4L\ 0x%04B

" Not having this makes webpack server unhappy. Bleh.
set backupcopy=yes
