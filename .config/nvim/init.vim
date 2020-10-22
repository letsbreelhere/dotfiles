source ~/.config/nvim/plugins.vim

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

map <C-o> :CtrlPMixed<cr>

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

" Run prettier on save
"let g:prettier#autoformat = 0
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

let g:neomake_haskell_enabled_makers = ['ghc_mod']
let g:neomake_haskell_ghcmod_maker = {
    \ 'exe': 'ghc-mod',
    \ 'args': ['check'],
    \ 'errorformat': 
        \ '%-G%\s%#,' .
        \ '%f:%l:%c:%trror: %m,' .
        \ '%f:%l:%c:%tarning: %m,'.
        \ '%f:%l:%c: %trror: %m,' .
        \ '%f:%l:%c: %tarning: %m,' .
        \ '%f:%l:%c:%m,' .
        \ '%E%f:%l:%c:,' .
        \ '%Z%m'
    \ }

" }}}

" Colors {{{

colorscheme ron
set bg=dark

hi StatusLine ctermfg=yellow ctermbg=black
" Use pleasant but visible search highlighting
hi Search ctermfg=white ctermbg=75 cterm=none
hi! link Visual Search

" }}}

" Filetype specific {{{

augroup rgbasm
  au!
  autocmd BufNewFile,BufRead *.rgbasm set syntax=rgbds
augroup END

augroup ruby
  au!
  "autocmd BufWritePre * ALEFix
augroup END

augroup javascript
  au!
  "autocmd BufWritePre * ALEFix
augroup END

augroup haskell
  au!
augroup END

augroup tmux
  au!
  autocmd Syntax tmux setlocal foldmethod=marker
  autocmd Syntax tmux normal zM
augroup END

augroup rust
  au!
  autocmd Syntax rust set tabstop=2
  autocmd Syntax rust set expandtab
  autocmd Syntax rust set shiftwidth=2
  au BufWritePost *.rs NeomakeProject
augroup END

" }}}

source ~/.config/nvim/settings.vim
source ~/.config/nvim/mappings.vim
