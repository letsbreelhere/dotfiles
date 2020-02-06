map <space> <leader>
nmap <space><space> <Plug>(easymotion-prefix)

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

map <leader>q :q<cr>
map <leader>Q :q!<cr>
map <leader>w :w<cr>
nmap <leader>x :x<cr>

" Open file prompt with current path
nmap <leader>e :e <C-R>=expand("%:p:h") . '/'<CR>

map <silent> <leader>n :NERDTreeToggle<cr>
map <silent> <leader><space> <nop>
map <leader>= <C-w>=
map <silent> <leader>l :ALEToggle<cr>

nmap <leader>it :InteroTypeInsert<cr>
nmap <leader>io :InteroOpen<cr>

noremap <silent> <leader>t :TagbarToggle<cr>

map <leader>be :BufExplorer<cr>

" Open window splits in various places
nmap <leader>sh :leftabove  vnew<CR>
nmap <leader>sl :rightbelow vnew<CR>
nmap <leader>sk :leftabove  new<CR>
nmap <leader>sj :rightbelow new<CR>
" }}}

imap <c-p> <c-r>=SuperTabAlternateCompletion("\<lt>c-x>\<lt>c-o>")<cr>

nmap <silent> <backspace> :set hlsearch!<cr>

" K searches the project for the word under the cursor
nnoremap K :Ack! "\b<C-R><C-W>\b"<CR>

" In visual mode, K searches the project for the selected text
vnoremap K "vy:Ack! "<C-R>""<CR>
