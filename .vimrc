set nocompatible
filetype off


"Add Vundle to runtime path
set rtp+=~/.vim/bundle/Vundle.vim


call vundle#begin()
Plugin 'gmarik/Vundle.vim'


"""""""""""""""""""""""
"" Add new plugins here
"""""""""""""""""""""""
Plugin 'scrooloose/nerdtree'
Plugin 'OmniSharp/omnisharp-vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'jreybert/vimagit'
Plugin 'prabirshrestha/asyncomplete.vim'

"""""""""""""""""""""""
"" End of plugin list
"""""""""""""""""""""""


map <C-o> :NERDTreeToggle<CR>
inoremap <expr> <Tab> pumvisible() ? '<C-n>' :                                                                                                                    
\ getline('.')[col('.')-2] =~# '[[:alnum:].-_#$]' ? '<C-x><C-o>' : '<Tab>'
nnoremap <C-o><C-u> :OmniSharpFindUsages<CR>
nnoremap <C-o><C-d> :OmniSharpGotoDefinition<CR>
nnoremap <C-o><C-d><C-p> :OmniSharpPreviewDefinition<CR>
nnoremap <C-o><C-r> :!dotnet run
nnoremap <C-o><C-f> :NERDTreeFocus<CR>

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#formatter = 'default'

" move among buffers with CTRL
map <C-J> :bnext<CR>
map <C-K> :bprev<CR>
map <C-Q> :bdelete<CR>

:set number

syntax on
call vundle#end()
filetype plugin indent on
filetype indent on 
