map <space> <leader>

"Fixing Pet Peeves {{{

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

" I literally never mean a bare u without preceding it with a g, and it causes
" shenanigans constantly.
vnoremap u <Nop>
vnoremap U <Nop>

" Don't leave visual mode after indent
vnoremap > >gv
vnoremap < <gv

" If D means d$, then Y should mean y$.
map Y y$

" Make * useful in visual mode
vmap <silent> * y/<c-r>"<cr>

" Kill the damned Ex mode.
nnoremap Q <nop>

" }}}

" Leader Mappings {{{

nmap <leader><space> <Plug>(easymotion-prefix)

" <leader> + pastebuffer-affecting commands use the system clipboard.
nmap <leader>D "+d$
vmap <leader>D "+d$
nmap <leader>P "+P
vmap <leader>P "+P
nmap <leader>Y "+y$
vmap <leader>Y "+y$
nmap <leader>d "+d
vmap <leader>d "+d
nmap <leader>p "+p
vmap <leader>p "+p
nmap <leader>y "+y
vmap <leader>y "+y

nmap <leader>j ddp
nmap <leader>k ddkP

map <leader>q :q<cr>
map <leader>Q :q!<cr>
map <leader>w :w<cr>
nmap <leader>x :x<cr>

" Open file prompt with current path
nmap <leader>e :e <C-R>=expand("%:p:h") . '/'<CR>

map <silent> <leader>n :NERDTreeToggle<cr>
map <leader>= <C-w>=

noremap <silent> <leader>t :TagbarToggle<cr>

map <leader>be :BufExplorer<cr>

" Open window splits in various places
nmap <leader>sh :leftabove  vnew<CR>
nmap <leader>sl :rightbelow vnew<CR>
nmap <leader>sk :leftabove  new<CR>
nmap <leader>sj :rightbelow new<CR>

map <leader>l <plug>(easymotion-bd-jk)
nmap <leader>l <plug>(easymotion-overwin-line)

" Fold mappings, because they make no sense by default

" Open all folds
nmap <leader>fO zR<cr>
" Close all folds
nmap <leader>fC zM<cr>
" Toggle fold
nmap <leader>ft za<cr>
" The obvious ones
nmap <leader>fo zo<cr>
nmap <leader>fc zc<cr>

" fzf baybee
nmap <leader>fr :Rg<cr>
nmap <leader>fl :Lines<cr>
nmap <leader>fb :Buffers<cr>
nmap <C-P> :Files<CR>

" Repeat last command-line instruction
nmap <leader>r @:

" Close all buffers but this one
nmap <leader>bc :%bd\|e#<cr>

" Swap previous buffer
nmap <leader>bb 

" }}}

imap <c-p> <c-r>=SuperTabAlternateCompletion("\<lt>c-x>\<lt>c-o>")<cr>

nmap <silent> <backspace> :set hlsearch!<cr>

" K searches the project for the word under the cursor
nnoremap K :execute 'Rg \b'.expand("<cword>").'\b'<cr>

" In visual mode, K searches the project for the selected text
vnoremap K "vy:Rg "<C-R>""<CR>
