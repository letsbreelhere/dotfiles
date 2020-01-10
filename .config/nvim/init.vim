source ~/.config/nvim/plugins.vim
source ~/.config/nvim/settings.vim
source ~/.config/nvim/mappings.vim

" Plugin config {{{

if executable('ag')
  " Use ag instead of the default CtrlP command since it's faster and doesn't
  " need caching.
  let g:ackprg = 'ag'
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
endif

if executable ('rg')
  " rg? Even better!
  let g:ackprg = 'rg --vimgrep --no-heading'
  let g:ctrlp_user_command = 'rg %s --files --color=never --glob ""'
endif

" rg and ag are fast enough to not need caching.
if (executable('rg') || executable('ag'))
  let g:ctrlp_use_caching = 0
endif

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
" Less flashy line:column display
let g:airline_section_z="%p%% L:%l/%L C:%v/%{strlen(getline('.'))}"
let g:airline_theme='bubblegum'

" }}}

" Colors and Fonts {{{

colorscheme ron
set bg=dark

" Use pleasant but very visible search hilighting
hi Search ctermfg=white ctermbg=75 cterm=none
hi! link Visual Search

" Set utf8 as standard encoding and en_US as the standard language
if !has('nvim')
  " Only set this for vim, since neovim is utf8 as default and setting it
  " causes problems when reloading the .vimrc configuration
  set encoding=utf8
endif

" Use Unix as the standard file type
set ffs=unix,dos,mac

" Use powerline fonts for airline
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

let g:airline_powerline_fonts = 1
" }}}

" Filetype specific {{{

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

" }}}
