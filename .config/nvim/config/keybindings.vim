"*****************************************************************************
"" Mappings
"*****************************************************************************
"Taskwarrior
noremap <Leader>t :TW <CR>

"" Clean search (highlight)
nnoremap <silent> <leader><space> :noh<cr>

"" Open current line on GitHub
nnoremap <Leader>o :.Gbrowse<CR>

" Search mappings: These will make it so that going to the next one in a
" search will center on the line it's found in.
nnoremap n nzzzv
nnoremap N Nzzzv

" session management
nnoremap <leader>so :OpenSession<Space>
nnoremap <leader>ss :SaveSession<Space>
nnoremap <leader>sd :DeleteSession<CR>
nnoremap <leader>sc :CloseSession<CR>
"" Set working directory
nnoremap <leader>. :lcd %:p:h<CR>


"" Opens a tab edit command with the path of the currently edited file filled
noremap <Leader>te :tabe <C-R>=expand("%:p:h") . "/" <CR>

cnoremap <C-P> <C-R>=expand("%:p:h") . "/" <CR>
nnoremap <silent> <leader>b :Buffers<CR>
nnoremap <silent> <leader>e :FZF -m<CR>

noremap <leader>w :w<CR>
noremap <leader>q :q<CR>
"" bind F1 and F2 to open vimrc
noremap  <F1> :e $MYVIMRC<CR>
noremap <leader><F1> :source $MYVIMRC<CR>

"" Makes netrw use ranger controls(j,l)
function! NetrwBuf()
  nmap <buffer> h -
  nmap <buffer> l <CR>
endfunction
augroup FILETYPES
  autocmd FileType netrw call NetrwBuf()
augroup END

"" Split
noremap <Leader>v :Vex <CR>
noremap <Leader>h :Sex <CR>
noremap ` :e. <CR>

"" Buffer nav
noremap <leader>z :bp<CR>
noremap <leader>x :bn<CR>

"" Close buffer
noremap <leader>c :bd<CR>

"" Switching windows
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l
noremap <C-h> <C-w>h

nnoremap <silent> <C-L> :vertical resize +10 <CR>
nnoremap <silent> <C-H> :vertical resize -10 <CR>

nnoremap <silent> <C-]> :10winc - <CR>
nnoremap <silent> <C-\> :10winc + <CR>



"noremap <C-/> :10winc + <CR>
"noremap <C-?> :10winc - <CR>
"nnoremap <silent> <Leader>+ :exe "resize " . (winheight(0) * 3/2)<CR>
"nnoremap <silent> <Leader>- :exe "resize " . (winheight(0) * 2/3)<CR>
"nnoremap <silent> <Leader>< :exe "vertical resize " . (winwidth(0) * 3/2)<CR>
"nnoremap <silent> <Leader>> :exe "vertical resize " . (winheight(0) * 2/3)<CR>

"nnoremap <silent> <C-]> :exe "resize " . (winheight(0) * 3/2)<CR>
"nnoremap <silent> <C-[> :exe "vertical resize " . (winwidth(0) * 2/3)<CR>
"nnoremap <silent> <C-\> :exe "resize " . (winheight(0) * 3/2)<CR>
"nnoremap <silent> <C-'> :exe "resize " . (winheight(0) * 2/3)<CR>
"" Vmap for maintain Visual Mode after shifting > and <
vmap < <gv
vmap > >gv

"" Move visual block
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv


"inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
"nnoremap <Leader>m :!make -C build
"noremap <C-m> :silent w <bar> !python % <CR>

