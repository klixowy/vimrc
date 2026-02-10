syntax on
set nocompatible
filetype on
filetype plugin on
filetype indent on
set relativenumber
set scrolloff=3
set shiftwidth=4
set tabstop=5
set expandtab
set incsearch
set hlsearch
set ignorecase
set showmode
set background=dark
set encoding=utf-8
set nobackup
" wild menu?
set wildmenu
set wildmode=list:longest
set wildignore=*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx
set signcolumn=yes
set updatetime=300

" keybindings
nnoremap <SPACE> <Nop>
let mapleader = " "
nnoremap <esc> :nohlsearch<CR>
nnoremap <leader>x :q<CR>
nnoremap <leader>s :wq<CR>
inoremap jj <esc>
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l
" Resize split windows using arrow keys by pressing:
noremap <c-up> <c-w>+
noremap <c-down> <c-w>-
noremap <c-left> <c-w>>
noremap <c-right> <c-w><

" tree file  side bar
noremap <C-b> :NERDTreeToggle<CR>


" PLUGINS ----------------- {{{

call plug#begin()

    Plug 'preservim/nerdtree'
    Plug 'dylanaraps/wal.vim'
    Plug 'morhetz/gruvbox'
    Plug 'mhinz/vim-startify'
    Plug 'neoclide/coc.nvim', {'branch': 'release'}

call plug#end()

" }}}
"
 let g:startify_custom_header =
       \ startify#pad(split(system('figlet -f dos.flf -w 100 gvim'), '\n'))

autocmd VimEnter * colorscheme wal

" STATUS LINE ------- {{{

set statusline=
set statusline+=\ %F\ %M\ %Y\ %R
"middle seperator
set statusline+=%=
set statusline+=:%p%%
set laststatus=2

" }}}

" VIM SCRIPT --------- {{{

let g:colors_on = 0

function! ToggleColors()
     if g:colors_on
        syntax reset
        set background=dark
        colorscheme wal
        let g:colors_on = 0
     else
        set background=dark
        colorscheme gruvbox
        let g:colors_on = 1
     endif
endfunction  

nnoremap <leader>t :call ToggleColors()<CR>

" }}}
"
"
"
" COC CONFIGURAITON ------ {{{
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
" }}}
