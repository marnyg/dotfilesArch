

let g:vim_markdown_override_foldtext = 0
let g:vim_markdown_folding_style_pythonic = 1
let g:vim_markdown_folding_level = 0
let g:vim_markdown_math = 1
inoremap <C-L> <C-G>u<Esc>[s1z=`]a<C-G>u 
set breakindent
set linebreak
autocmd BufEnter *.md :set spell spelllang=nb
autocmd BufEnter eksamenV2016.md :setlocal spellfile+=oneoff.utf-8.add


nnoremap <leader><cr> :TREPLSendLine<cr>j " send current line and move down
vnoremap <leader><cr> :TREPLSendSelection<cr> " send current selection
noremap <Leader>tr :T 
noremap <Leader>tc :Tclear <CR>
noremap <Leader>tk :Tkill <CR>
noremap <Leader>tt :Ttoggle <CR>
noremap <Leader>tn <C-n> :Tnew <CR>


"*****************************************************************************
"" Mappings
"*****************************************************************************


" session management
nnoremap <leader>so :OpenSession<Space>
nnoremap <leader>ss :SaveSession<Space>
nnoremap <leader>sd :DeleteSession<CR>
nnoremap <leader>sc :CloseSession<CR>

"" Set working directory
nnoremap <leader>. :lcd %:p:h<CR>

"" Opens an edit command with the path of the currently edited file filled in
noremap <Leader>e :e <C-R>=expand("%:p:h") . "/" <CR>

"" Opens a tab edit command with the path of the currently edited file filled
noremap <Leader>te :tabe <C-R>=expand("%:p:h") . "/" <CR>

cnoremap <C-P> <C-R>=expand("%:p:h") . "/" <CR>
nnoremap <silent> <leader>b :Buffers<CR>
nnoremap <silent> <leader>e :FZF -m<CR>

"" bind F1 and F2 to open vimrc
noremap <leader>w :w<CR>
noremap <leader>q :q<CR>
noremap  <F2> :e $MYVIMRC<CR>
noremap <leader><F2> :source $MYVIMRC<CR>
noremap <leader><F1> :source ~/.config/nvim/local_init.vim<CR>
noremap <F1> :e ~/.config/nvim/local_init.vim<CR>

"" Makes netrw use ranger controls(j,l)
function! NetrwBuf()
  nmap <buffer> h -
  nmap <buffer> l <CR>
endfunction
augroup FILETYPES
  autocmd FileType netrw call NetrwBuf()
augroup END

"" Split
""noremap <Leader>h :<C-u>split<CR>
""noremap <Leader>v :<C-u>vsplit<CR>
"" open netrw on splitt
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
noremap <C-L> :10winc - <CR>
noremap <C-H> :10winc + <CR>

"" Vmap for maintain Visual Mode after shifting > and <
vmap < <gv
vmap > >gv

"" Move visual block
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv


autocmd FileType javascript let g:SuperTabDefaultCompletionType = "<c-x><c-o>"
let g:UltiSnipsExpandTrigger="<C-j>"
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"


nnoremap <Leader>m :!make -C build
