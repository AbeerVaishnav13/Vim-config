" Basic config
" Set relative line numbering
set nu rnu

" set tab length = 4 and other  indentation related stuff
set tabstop=4
set shiftwidth=4
set softtabstop=4
set smartindent

" Syntax check: ON
syntax on

" file encoding
set encoding=utf8

" Highlight search keyword: OFF
set nohlsearch

" Set scroll offset
set scrolloff=10

" For proper letter case
set smartcase

" Disable error bells
set noerrorbells

" Natural window splits
set splitright
set splitbelow

" Case sensitive search
set incsearch

" Line break: ON
set linebreak

" No text wrapping
set nowrap

" Set proper colors
set t_Co=256
set t_ut=

" Enable mouse
set mouse=a

" Map leader key
let mapleader=","

" Clear all registers
command! WipeRegs let regs='abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789/-*+"' | let i=0 | while (i < strlen(regs)) | exec 'let @'.regs[i].'=""' | let i=i+1 | endwhile | unlet regs

" Options for fuzzy search
set nocompatible	" Limit search to the project dir
set path+=**		" Search within subdirectories of the project recursively
set wildmenu		" Shows multiple matches on a pop-up menu

" Use dark background
set background=dark

" Edit this part for colorscheme
colorscheme default

if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
endif

" Key bindings
" For remapping escape key to provide greater access
nnoremap <C-c> <Esc>
vnoremap <C-c> <Esc>
snoremap <C-c> <Esc>
inoremap <C-c> <Esc>
nnoremap <Esc> <C-c>
vnoremap <Esc> <C-c>
snoremap <Esc> <C-c>
inoremap <Esc> <C-c>

" Remapping substituition for ease of access
nnoremap S :%s//g<Left><Left>
vnoremap S :s//g<Left><Left>

" Spell command toggle
nnoremap <leader>sp :set spell!<CR>

" For ease of typing command
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
nnoremap <silent> J :bp<CR>
nnoremap <silent> K :bn<CR>

" Better search positioning
nnoremap n nzz
nnoremap N Nzz

" Cursor navigation (HJUK instead of HJKL)
" All modes
noremap u k
noremap k l
noremap U u

" Tab switching
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

" Basic commands
" All modes
noremap W :w<CR>
noremap SQ :q!<CR>

" Making split window easier
" All modes
noremap <M-u> <C-w>k
noremap <M-k> <C-w>l
noremap <M-j> <C-w>j
noremap <M-h> <C-w>h
noremap <M-]> <C-w>>
noremap <M-[> <C-w><
noremap <M-p> <C-w>+
noremap <M-o> <C-w>-
noremap <M-=> <C-w>=

" Window orientation (Mainly for use with vim terminal)
function! Halign()
  if &filetype == ''
    wincmd J
    resize -10
  else
    wincmd K
    resize +10
  endif
endfunction

function! Valign()
  if &filetype == ''
    wincmd L
    vertical resize -25
  else
    wincmd H
    vertical resize +25
  endif
endfunction

noremap <silent> <C-k> :call Valign()<CR>
noremap <silent> <C-h> :call Halign()<CR>
