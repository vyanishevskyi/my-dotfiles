"--------------------------Plugins-----------------------------------------"

call plug#begin('~/.vim/plugged')

Plug 'mileszs/ack.vim'

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

"Plugin for tree-like project structure browsing
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }

"For commenting. command - <leader>cc
Plug 'scrooloose/nerdcommenter'

"For git features in vim. Explore docs
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

"For file searching
Plug 'kien/ctrlp.vim'

"Colorscheme
Plug 'chriskempson/base16-vim'

"Syntax checking
Plug 'scrooloose/syntastic'

"JavaScript
Plug 'pangloss/vim-javascript'
Plug 'maxmellon/vim-jsx-pretty'

call plug#end()


"----------------------General Settings------------------------------------"

"Out-of-the-box syntax highlighing enabling
syntax enable

"Colorscheme setup
colorscheme base16-default-dark

set backspace=indent,eol,start

"Setting line numbers
set number

set expandtab

"Setting tabsize and shiftsize(>/<) to 2 spaces
set tabstop=2
set shiftwidth=2

"Leader key mapping
let mapleader=','

"------------------------------Visuals-------------------------------------"

"For base16-shell themes
if filereadable(expand("~/.vimrc_background"))
  let base16colorspace=256
  source ~/.vimrc_background
endif

"Some hooks to access <t_CO> colors in vim. Seems like it's working without
"this commands
let base16colorspace=256
set t_Co=256

"------------------------------Search--------------------------------------"

"Set search hightligting
set hlsearch

set incsearch


"--------------------------Splits--------------------------------
set splitbelow
set splitright

nmap <C-J> <C-W><C-J>
nmap <C-K> <C-W><C-K>
nmap <C-H> <C-W><C-H>
nmap <C-L> <C-W><C-L>
"-----------------------------Mappings-------------------------------------"

"Set nerdtree key mapping
map <C-n> :NERDTreeToggle<CR>
map <C-\> :NERDTreeToggle<CR>

"Make it easy to edit the .vimrc file
nmap <Leader>ev :tabedit $MYVIMRC<cr>

"Removes hightlight
nmap <Leader><space> :nohlsearch<cr>

nmap <c-R> :CtrlPBufTag<cr>

"Most recent used file 
nmap <c-E> :CtrlPMRUFiles<cr>


"---------------------------Plugins configs ---------------------"
"
" CtrlP
"
let g:ctrlp_custom_ignore = 'node_modules|git'

"Silver search
let g:ackprg = 'ag --nogroup --nocolor --column'

" ===================== Syntastic settings  ====================================

let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_error_symbol = '✗✗'
let g:syntastic_style_error_symbol = '✠✠'
let g:syntastic_warning_symbol = '∆∆'
let g:syntastic_style_warning_symbol = '≈≈'
let g:syntastic_ruby_checkers = ["mri", "rubocop"]

" javascript
let g:vim_jsx_pretty_colorful_config = 1

"git 
let g:gitgutter_terminal_reports_focus=0

"---------------------------Auto-Commands----------------------------------"

"Automatically source the .vimrc file on save
augroup autosourcing
  autocmd!
  autocmd BufWritePost .vimrc source $MYVIMRC                               
augroup END 
