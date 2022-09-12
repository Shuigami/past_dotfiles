filetype plugin indent on
filetype indent on 
"" ~/.vimrc ""

""""""""""""""""""""""""""""""""" Basic config """""""""""""""""""""""""""""""""

"" Restricted length ""
set colorcolumn=80
set textwidth=80

"" Syntax on ""
noremap <C-i> :syntax on<cr>

"" Set encoding ""
set encoding=utf-8

"" Disable beeping ""
set belloff=all

"" Using clipboard as the default register ""
set clipboard=unnamedplus

"" Fix backspace ""
set backspace=eol,start,indent

"" For performence ""
set lazyredraw

"" Display space after lines ""
set list listchars=tab:»·,trail:·

"" Converting tabs to spaces ""
set expandtab
set smarttab
set shiftround
set shiftwidth=4
set softtabstop=4
set tabstop=8

"" Indent ""
set smartindent
set autoindent
set cindent

"" Number line ""
set number

"" Enable relative numbers ""
" set relativenumber

"" Scrolling ""
set mouse=a

"" Wrapping text ""
set linebreak

"" Highlight the line under scheme ""
set cursorline

"" Text seleted to clipboard ""
set clipboard=autoselect

"" Enable syntax highlighting ""
syntax enable
syntax on

"" Search ""
set ignorecase

"" Highlight search ""
set hlsearch

"" Enable spellchecking ""
set spell


""""""""""""""""""""""""""""""""" Vundle config """""""""""""""""""""""""""""""""

"" Use VIM settings ""
set nocompatible

" Detect the type of file
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

"" Vundle ""lugin 'gmarik/Vundle.vim'

"" NerdTree ""
Plugin 'scrooloose/nerdtree'
nnoremap <C-o> :NERDTreeToggle<CR>
nnoremap <C-o><C-f> :NERDTreeFocus<CR>

"" Auto completion ""
Plugin 'ycm-core/YouCompleteMe' 

"" Tabnine ""
Plugin 'zxqfl/tabnine-vim' 

""  ""
inoremap <expr> <Tab> pumvisible() ? '<C-n>' :                                                                                                                    
\ getline('.')[col('.')-2] =~# '[[:alnum:].-_#$]' ? '<C-x><C-o>' : '<Tab>'

"" OmniSharp ""
Plugin 'OmniSharp/omnisharp-vim'
nnoremap <C-o><C-u> :OmniSharpFindUsages<CR>
nnoremap <C-o><C-d> :OmniSharpGotoDefinition<CR>
nnoremap <C-o><C-d><C-p> :OmniSharpPreviewDefinition<CR>

"" Dotnet ""
nnoremap <C-o><C-r> :!dotnet run

"" Themes for vim ""
Plugin 'rafi/awesome-vim-colorschemes' 

"" Tabline ""
Plugin 'itchyny/lightline.vim' 

"" Vim Airline (bottom bar) ""
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#formatter = 'default'

"" Vimagit ""
Plugin 'jreybert/vimagit'

"" Asyncomplete ""
Plugin 'prabirshrestha/asyncomplete.vim'

"" Git ""
Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'

"" LaTeX ""
Plugin 'lervag/vimtex' 

"" Indentation ""
Plugin 'Yggdroot/indentLine' 

"" Auto-save ""
Plugin '907th/vim-auto-save' 

" move among buffers with CTRL
map <C-J> :bnext<CR>
map <C-K> :bprev<CR>
map <C-Q> :bdelete<CR>

:set number

syntax on

call vundle#end()

filetype plugin indent on

"" Themes ""
" set termguicolors
" set background=dark
" colorscheme onehalfdark

"" Tabline ""
" let g:airline_theme='onehalfdark'
set laststatus=2
let g:lightline = {
    \ 'colorscheme': 'one',
    \ }

"" Indent line to | ""
let g:indentLine_char='|'

"" Auto-save ""
let g:auto_save = 1

"" Ctrl-f Seach "
nnoremap <C-F> /

"" Close brackets for C# ""
autocmd Filetype {cs,py,c,cpp,h} call SetCSharpAutocompletion()

function SetCSharpAutocompletion()
  inoremap {      {}<Left>
  inoremap {<CR>  <CR>{<CR>}<Esc>O
  inoremap {{     {
  inoremap {}     {}

  inoremap (  ()<Left>
  inoremap <expr> )  strpart(getline('.'), col('.')-1, 1) == ")" ? "\<Right>" : ")"
  inoremap <expr> <BS>  strpart(getline('.'), col('.')-2, 2) == "()" ? "\<BS><Del>" : strpart(getline('.'), col('.')-2, 2) == "''" ? "\<BS><Del>" : strpart(getline('.'), col('.')-2, 2) == "\"\"" ? "\<BS><Del>" : "\<BS>"


  inoremap [  []<Left>
  inoremap <expr> ]  strpart(getline('.'), col('.')-1, 1) == "]" ? "\<Right>" : "]"

  inoremap <expr> ' strpart(getline('.'), col('.')-1, 1) == "\'" ? "\<Right>" : "\'\'\<Left>"
  inoremap <expr> " strpart(getline('.'), col('.')-1, 1) == "\"" ? "\<Right>" : "\"\"\<Left>"
"  inoremap <expr> <BS>  strpart(getline('.'), col('.')-2, 2) == "''" ? "\<BS><Del>" : "\<BS>"

"  inoremap <expr> ; strpart(getline('.'), col('.')-1, 1) == ")" ? "\<End>;" : ";"

  inoremap for<Space> for ()<Left>
  inoremap if<Space> if ()<Left>
  inoremap if<Tab> if ()<Left>
endfunction


"" F7 - Remove syntax ""
noremap <F7> :if exists("g:syntax_on") <Bar>
    \ syntax off <Bar>
    \ else <Bar>
    \ syntax enable <Bar>
    \ endif <CR>
