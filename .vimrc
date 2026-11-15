
" ALE : à définir AVANT le chargement du plugin
let g:ale_completion_enabled = 1

call plug#begin('~/.vim/plugged')
Plug 'morhetz/gruvbox'                 " thème
Plug 'vim-airline/vim-airline'         " barre de statut
Plug 'preservim/nerdtree'              " explorateur de fichiers
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'                " recherche floue
Plug 'dense-analysis/ale'              " lint + LSP (clangd) + complétion
Plug 'tpope/vim-commentary'            " gcc pour commenter
Plug 'jiangmiao/auto-pairs'            " ferme (), {}, []
Plug 'tpope/vim-fugitive'              " Git
Plug 'tpope/vim-surround'
Plug 'vim-airline/vim-airline-themes'
Plug 'toupeira/vim-desertink'
call plug#end()

" --- Général ---
set nocompatible
filetype plugin indent on
syntax on
set encoding=utf-8
set number relativenumber
set cursorline
set scrolloff=8
set hidden
set mouse=a
set clipboard=unnamedplus
set wildmenu
set incsearch hlsearch ignorecase smartcase
set noswapfile
set undofile undodir=~/.vim/undo//
set updatetime=300
set signcolumn=yes

" --- Indentation (style C) ---
set autoindent smartindent cindent
set tabstop=4 shiftwidth=4 softtabstop=4
set expandtab                 " mettre noexpandtab pour des vraies tabulations (kernel, 42...)
set colorcolumn=80

" --- Leader ---
let mapleader = " "

" --- Airline : look ancien, sans glyphes powerline ---
let g:airline_powerline_fonts = 0
let g:airline_theme = 'desertink'
let g:airline_left_sep = ''
let g:airline_right_sep = ''
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'

" --- ALE : symboles ASCII ---
let g:ale_sign_error = '>>'
let g:ale_sign_warning = '--'
let g:ale_echo_msg_format = '[%linter%] %s'

" --- NERDTree : aspect classique ---
let g:NERDTreeDirArrowExpandable = '+'
let g:NERDTreeDirArrowCollapsible = '-'
let NERDTreeMinimalUI = 1
let NERDTreeWinSize = 28

" --- fzf : fenêtre simple en bas ---
let g:fzf_layout = { 'down': '40%' }

" --- Thème rétro ---
set termguicolors
set background=dark
set fillchars=vert:\|,fold:-
set laststatus=2

" colonne de 80 en gris discret
highlight ColorColumn ctermbg=235 guibg=#2c2c2c

" --- Forme du curseur selon le mode ---
let &t_SI = "\e[6 q"   " insertion : barre verticale
let &t_SR = "\e[4 q"   " remplacement : souligné
let &t_EI = "\e[2 q"   " normal : bloc

" Rétablit le bon curseur au démarrage et à la sortie de Vim
augroup cursor_shape
  autocmd!
  autocmd VimEnter * silent! normal! :startinsert | stopinsert
  autocmd VimLeave * silent! !echo -ne "\e[6 q"
augroup END

" --- ALE : clangd + clang-format ---
let g:ale_linters = {'c': ['clangd', 'gcc'], 'cpp': ['clangd', 'g++']}
let g:ale_fixers  = {'c': ['clang-format'], 'cpp': ['clang-format']}
let g:ale_c_gcc_options = '-Wall -Wextra -std=c11'
let g:ale_fix_on_save = 0
set omnifunc=ale#completion#OmniFunc
nmap <silent> gd :ALEGoToDefinition<CR>
nmap <silent> gr :ALEFindReferences<CR>
nmap <silent> K  :ALEHover<CR>
nmap <silent> [e <Plug>(ale_previous_wrap)
nmap <silent> ]e <Plug>(ale_next_wrap)
nmap <leader>f :ALEFix<CR>

" --- NERDTree & fzf ---
nnoremap <leader>e :NERDTreeToggle<CR>
nnoremap <leader>p :Files<CR>
nnoremap <leader>g :Rg<CR>
nnoremap <leader>b :Buffers<CR>
