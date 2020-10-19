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
set noshowmode

let mapleader=","

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
nnoremap <C-c> <Esc>
vnoremap <C-c> <Esc>
snoremap <C-c> <Esc>
inoremap <C-c> <Esc>
nnoremap <Esc> <C-c>
vnoremap <Esc> <C-c>
snoremap <Esc> <C-c>
inoremap <Esc> <C-c>

nnoremap S :%s//g<Left><Left>
vnoremap S :s//g<Left><Left>
nnoremap <leader>sp :set spell!<CR>
noremap ; :
noremap : ;

" Terminal
noremap <M-t> :vsp<CR>:term<CR>:vertical resize -25<CR>A
tnoremap <M-q> <C-\><C-n>

" Buffer manipulation
function! BufDelOrQuit()
	let s:num_buf = len(filter(range(1, bufnr('$')), 'buflisted(v:val)'))
	if s:num_buf > 1
		:bd!
	else
		:q
	endif
endfunction

nnoremap Q :call BufDelOrQuit()<CR>
nnoremap J :bp<CR>
nnoremap K :bn<CR>

" Better search
nnoremap n nzz
nnoremap N Nzz

" Cursor navigation
" All modes
noremap u k
noremap k l
noremap U u

" Tab manipulation
" Normal mode
nnoremap gk gt
nnoremap gh gT

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
noremap SQ :q!<CR>

" Making split window easier
" All modes
noremap <C-w>u <C-w>k
noremap <C-w>j <C-w>j
noremap <C-w>k <C-w>l
noremap <C-w>h <C-w>h
noremap <C-]> <C-w>>
noremap <C-[> <C-w><
noremap <C-p> <C-w>+
noremap <C-o> <C-w>-
noremap <leader>= <C-w>=
