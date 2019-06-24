
noremap <leader>w :w<CR>
noremap <leader>q :q<CR>
noremap  <F2> :e $MYVIMRC<CR>
noremap <leader><F2> :source $MYVIMRC<CR>
noremap <leader><F1> :source ~/.config/nvim/local_init.vim<CR>
noremap <F1> :e ~/.config/nvim/local_init.vim<CR>

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
