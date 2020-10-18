" Basic config
set nu rnu
set tabstop=4
set shiftwidth=4
set softtabstop=4
syntax on
set encoding=utf8
set nohlsearch
set scrolloff=10
set smartcase
set smartindent
set noerrorbells
set splitright
set incsearch
set linebreak
set nowrap
set t_Co=256
set t_ut=
set mouse=a

let mapleader=" "
let g:cur_dir_path = expand("%:p:h") . ''

" Clear all registers
command! WipeRegs let regs='abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789/-*+"' | let i=0 | while (i < strlen(regs)) | exec 'let @'.regs[i].'=""' | let i=i+1 | endwhile | unlet regs

" Options for fuzzy search
set nocompatible	" Limit search to the project dir
set path+=**		" Search within subdirectories of the project recursively
set wildmenu		" Shows multiple matches on a pop-up menu

set background=dark

" Edit this part for colorscheme


if exists('+termguicolors')
	let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
	let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
endif

" Key bindings
" For remapping keys to provide greater access
inoremap <C-c> <Esc>
vnoremap <C-c> <Esc>
nnoremap <C-c> <Esc>
snoremap <C-c> <Esc>
inoremap <Esc> <C-c>
vnoremap <Esc> <C-c>
nnoremap <Esc> <C-c>
snoremap <Esc> <C-c>
nnoremap S :%s//g<Left><Left>
vnoremap S :s//g<Left><Left>
nnoremap <leader>sp :set spell!<CR>
noremap ; :
noremap : ;

" Terminal
noremap <leader>tt :vsp<CR>:term<CR>:vertical resize -25<CR>A
tnoremap <C-q> <C-\><C-n>

" Cursor navigation
" All modes
noremap u k
noremap k l
noremap U u

" Indentation
vnoremap <Tab> >gv
vnoremap <S-Tab> <gv

" Normal mode
nnoremap <leader>tn :tabnew
nnoremap <leader>tc :tabclose<CR>
nnoremap <leader>vs :vsplit<space>
nnoremap <leader>hs :split<space>

" Exit commands
" All modes
noremap W :w<CR>
noremap Q :q<CR>
noremap SQ :q!<CR>

" Tab manipulation
" Normal mode
nnoremap gk gt
nnoremap gh gT

" Making split window easier
" All modes
noremap <leader>u <C-w>k
noremap <leader>j <C-w>j
noremap <leader>k <C-w>l
noremap <leader>h <C-w>h
noremap <C-]> <C-w>>
noremap <C-[> <C-w><
noremap <C-p> <C-w>+
noremap <C-o> <C-w>-
noremap <leader>= <C-w>=
