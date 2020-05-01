"*****************************************************************************
"" Vim-PLug core
"*****************************************************************************
let vimplug_exists=expand('~/.config/nvim/autoload/plug.vim')

let g:vim_bootstrap_langs = ""
let g:vim_bootstrap_editor = "nvim"				" nvim or vim

if !filereadable(vimplug_exists)
  if !executable("curl")
    echoerr "You have to install curl or first install vim-plug yourself!"
    execute "q!"
  endif
  echo "Installing Vim-Plug..."
  echo ""
  silent exec "!\curl -fLo " . vimplug_exists . " --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
  let g:not_finish_vimplug = "yes"

  autocmd VimEnter * PlugInstall
endif

" Required:
call plug#begin(expand('~/.config/nvim/plugged'))

"*****************************************************************************
"" Plug install packages
"*****************************************************************************
Plug 'tpope/vim-commentary'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'vim-scripts/CSApprox'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-surround'
Plug 'xarthurx/taskwarrior.vim'

Plug 'rbgrouleff/bclose.vim' 
"Plug 'francoiscabrol/ranger.vim'
Plug 'ptzz/lf.vim'
Plug 'jceb/vim-orgmode'


"" Color
Plug 'tomasr/molokai'


if isdirectory('/usr/local/opt/fzf')
  Plug '/usr/local/opt/fzf' | Plug 'junegunn/fzf.vim'
else
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --bin' }
  Plug 'junegunn/fzf.vim'
endif
"*****************************************************************************
""deoplete
"*****************************************************************************
"Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
""python    
"Plug 'deoplete-plugins/deoplete-jedi' 
"
"
"hhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhere to h
"hhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhere to h
"hhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhere to h

"Plug 'prabirshrestha/async.vim'
"Plug 'prabirshrestha/asyncomplete.vim'
"Plug 'prabirshrestha/asyncomplete-lsp.vim'
"Plug 'prabirshrestha/vim-lsp'
"Plug 'ryanolsonx/vim-lsp-python'
"Plug 'ryanolsonx/vim-lsp-javascript'
"Plug 'mattn/vim-lsp-settings'
"Plug 'OmniSharp/omnisharp-vim'
"Plug 'w0rp/ale'


if executable('docker-langserver')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'docker-langserver',
        \ 'cmd': {server_info->[&shell, &shellcmdflag, 'docker-langserver --stdio']},
        \ 'whitelist': ['dockerfile'],
        \ })
endif

"Plug 'mattn/vim-lsp-settings'

"
"hhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhere to h
"hhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhere to h
"alternativ
Plug 'neovim/nvim-lsp'
"Plug 'maralla/completor.vim'




call plug#end()

"
"" fzf.vim
set wildmode=list:longest,list:full
set wildignore+=*.o,*.obj,.git,*.rbc,*.pyc,__pycache__,1TB**
let $FZF_DEFAULT_COMMAND =  "find * -path '*/\.*' -prune -o -path 'node_modules/**' -o -path '__pycache__/**' -prune -o -path 'MEGA*/**' -prune -o -path '1TB/**' -prune -o -path 'target/**' -prune -o -path 'dist/**' -prune -o  -type f -print -o -type l -print 2> /dev/null"


lua require'nvim_lsp'.pyls.setup{}
lua require'nvim_lsp'.bashls.setup{}
autocmd Filetype python setlocal omnifunc=v:lua.vim.lsp.omnifunc
nnoremap <silent> gd    <cmd>lua vim.lsp.buf.declaration()<CR>
nnoremap <silent> <c-d> <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> K     <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> gD    <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> <c-k> <cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap <silent> 1gD   <cmd>lua vim.lsp.buf.type_definition()<CR>
nnoremap <silent> gr    <cmd>lua vim.lsp.buf.references()<CR>

au BufReadPost,BufNewFile *.py set foldmethod=indent

set foldmethod=expr
  \ foldexpr=lsp#ui#vim#folding#foldexpr()
  \ foldtext=lsp#ui#vim#folding#foldtext()


" Vim-Session
Plug 'xolox/vim-misc'
Plug 'xolox/vim-session'

"" Snippets
"Plug 'SirVer/ultisnips'
"Plug 'honza/vim-snippets'


