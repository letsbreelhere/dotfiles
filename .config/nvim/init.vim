source ~/.config/nvim/plugins.vim

" Use indentation for folds
set foldmethod=indent
set foldnestmax=5
set foldlevelstart=99
set foldcolumn=0

augroup vimrcFold
  " fold vimrc itself by categories
  autocmd!
  autocmd FileType vim set foldmethod=marker
  autocmd FileType vim set foldlevel=0
augroup END

" Sets how many lines of history VIM has to remember
set history=700

" Set to auto read when a file is changed from the outside
set autoread

map <space> <leader>

map <leader>q :q<cr>
map <leader>w :w<cr>

" Mouse in normal mode only. I only use it (rarely) for scrolling.
set mouse=n

" Ugh. This keeps a palm tap on the touchpad from being detected as a
" middle-click and pasting crap all over the buffer, even in normal mode.
map <MiddleMouse> <Nop>
map <2-MiddleMouse> <Nop>
map <3-MiddleMouse> <Nop>
map <4-MiddleMouse> <Nop>
imap <MiddleMouse> <Nop>
imap <2-MiddleMouse> <Nop>
imap <3-MiddleMouse> <Nop>
imap <4-MiddleMouse> <Nop>

" If D means d$, then Y should mean y$.
map Y y$

" <leader> + pastebuffer-affecting commands use the system clipboard.
nmap <leader>y "+y
nmap <leader>Y "+y$
nmap <leader>d "+d
nmap <leader>D "+d$
nmap <leader>p "+p
nmap <leader>P "+P
vmap <leader>y "+y
vmap <leader>Y "+y$
vmap <leader>d "+d
vmap <leader>D "+d$
vmap <leader>p "+p
vmap <leader>P "+P

nmap <leader>j ddp
nmap <leader>k ddkP

map <silent> <leader>n :NERDTreeToggle<cr>
map <silent> <leader><space> <nop>
map <leader>= <C-w>=
map <silent> <leader>l :ALEToggle<cr>

nmap <leader>it :InteroTypeInsert<cr>
nmap <leader>io :InteroOpen<cr>

noremap <leader>t :TagbarToggle<cr>

map <leader>be :BufExplorer<cr>

imap <c-p> <c-r>=SuperTabAlternateCompletion("\<lt>c-x>\<lt>c-o>")<cr>

nmap <backspace> :set hlsearch!<cr>
nmap <leader>x :ColorToggle<cr>

" Don't leave visual mode after indent
vnoremap > >gv
vnoremap < <gv

" I literally never mean a bare u without preceding it with a g, and it causes
" shenanigans constantly.
vnoremap u <Nop>
vnoremap U <Nop>

set wildignorecase
set wildmode=list:longest,full
set wildmenu
set backspace=eol,start,indent

set undofile
set undodir=$HOME/.vimundo/

" Split in the more natural way
set splitright
set splitbelow

set nowrap
set textwidth=80

set cursorline

set virtualedit=block

if executable('ag')
  " Use ag instead of the default CtrlP command since it's faster and doesn't
  " need caching.
  let g:ackprg = 'ag'
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
endif

if executable ('rg')
  let g:ackprg = 'rg --vimgrep --no-heading'
  let g:ctrlp_user_command = 'rg %s --files --color=never --glob ""'
endif

" rg and ag are fast enough to not need caching.
if (executable('rg') || executable('ag'))
  let g:ctrlp_use_caching = 0
endif

" K searches the project for the word under the cursor
nnoremap K :Ack! "\b<C-R><C-W>\b"<CR>

" In visual mode, K searches the project for the selected text
vnoremap K "vy:Ack! "<C-R>""<CR>

" Immensely janky find and replace.
" Here mostly so I remember I can do `cfdo`.
function Far(from, to)
  let l:oldhighlight = g:ackhighlight
  let g:ackhighlight = 1
  exec "Ack '" . a:from . "'"
  exec "cfdo %s//" . a:to . "/g | update"
  let g:ackhighlight = l:oldhighlight
endfunction

command -nargs=+ Far call Far(<f-args>)
command -nargs=+ Ag :Ack <args>

let g:prettier#autoformat = 0
" Run prettier on save
"autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql Prettier

" Disabling haskell-vim-now annoyances
let g:no_haskell_conceal = 1
let g:haskellmode_completion_ghc = 0

let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'javascript': ['eslint'],
\   'ruby': ['rubocop'],
\   'haskell': ['hlint']
\}
let g:ale_ruby_rubocop_options = '--safe'
let g:ale_linters = {
\   'javascript': ['eslint'],
\   'typescript': ['tsserver', 'tslint'],
\   'mustache': ['ember-template-lint'],
\   'haskell': ['hlint']
\}

" Airline styling
let g:airline_section_x='' " Don't display filetype
let g:airline_section_b='' " Don't display branch
let g:airline_section_z='%p:%v' " Less flashy line:column display
let g:airline_theme='luna'

augroup rgbasm
  au!
  autocmd BufNewFile,BufRead *.rgbasm set syntax=rgbds
augroup END

augroup ruby
  au!
  autocmd BufWritePre * ALEFix
augroup END

augroup javascript
  au!
  autocmd BufWritePre * ALEFix
augroup END

augroup haskell
  au!
  autocmd BufWritePost *.hs InteroLoadCurrentFile
augroup END

" Disable ALE highlighting, for the abomination that is my current job's
" codebase
hi link ALEWarning none

" Colors and Fonts {{{

try
  colorscheme wombat256mod
catch
endtry

" Adjust signscolumn to match wombat
hi! link SignColumn LineNr

" Use pleasant but very visible search hilighting
hi Search ctermfg=white ctermbg=173 cterm=none guifg=#ffffff guibg=#e5786d gui=none
hi! link Visual Search

" Match wombat colors in nerd tree
hi Directory guifg=#8ac6f2

" Searing red very visible cursor
hi Cursor guibg=red

" Don't blink normal mode cursor
set guicursor=n-v-c:block-Cursor
set guicursor+=n-v-c:blinkon0

" Set extra options when running in GUI mode
if has("gui_running")
  set guioptions-=T
  set guioptions-=e
  set guitablabel=%M\ %t
endif
set t_Co=256

" Set utf8 as standard encoding and en_US as the standard language
if !has('nvim')
  " Only set this for vim, since neovim is utf8 as default and setting it
  " causes problems when reloading the .vimrc configuration
  set encoding=utf8
endif

" Use Unix as the standard file type
set ffs=unix,dos,mac

" Use large font by default in MacVim
set gfn=Monaco:h19

" Use powerline fonts for airline
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

let g:airline_powerline_fonts = 1
let g:airline_symbols.space = "\ua0"
" }}}

colorscheme ron
set bg=dark

" Manually create key mappings (to avoid rebinding C-\)
let g:tmux_navigator_no_mappings = 1

nnoremap <silent> <C-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <C-j> :TmuxNavigateDown<cr>
nnoremap <silent> <C-k> :TmuxNavigateUp<cr>
nnoremap <silent> <C-l> :TmuxNavigateRight<cr>

" Open window splits in various places
nmap <leader>sh :leftabove  vnew<CR>
nmap <leader>sl :rightbelow vnew<CR>
nmap <leader>sk :leftabove  new<CR>
nmap <leader>sj :rightbelow new<CR>

" Kill the damned Ex mode.
nnoremap Q <nop>
" Show trailing whitespace
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
