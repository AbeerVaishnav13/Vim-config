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

" Map leader key
let mapleader=" "

" Clear all registers
function! WR()
  let regs='abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789/-*+"'
  let i=0
  while (i < strlen(regs))
    exec 'let @'.regs[i].'=""'
    let i=i+1
  endwhile
  unlet regs
endfunction

command! WipeRegs call WR()

" Options for fuzzy search
set nocompatible	" Limit search to the project dir
set path+=**		" Search within subdirectories of the project recursively
set wildmenu		" Shows multiple matches on a pop-up menu

" Use dark background
set background=dark

" Edit this part for colorscheme
colorscheme default

" Key bindings
" For remapping escape key to provide greater access
nnoremap <silent><C-c> <Esc>:noh<CR>
vnoremap <silent><C-c> <Esc>:noh<CR>
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

" Buffer manipulation
function! BufDelOrQuit()
  let s:num_buf = len(filter(range(1, bufnr('$')), 'buflisted(v:val)'))
  if s:num_buf > 1
    :bd
  else
    :q
  endif
endfunction

function! BufDelOrQuitImm()
  let s:num_buf = len(filter(range(1, bufnr('$')), 'buflisted(v:val)'))
  if s:num_buf > 1
    :bd!
  else
    :q!
  endif
endfunction

nnoremap <silent> Q :call BufDelOrQuit()<CR>
noremap <silent> SQ :call BufDelOrQuitImm()<CR>
nnoremap <silent> H :bp<CR>
nnoremap <silent> K :bn<CR>

" Better search positioning
nnoremap n nzz
nnoremap N Nzz

" Cursor navigation (HJUK instead of HJKL)
" All modes
noremap u k
noremap k l
noremap U u
noremap 8 0
noremap 9 ^
noremap 0 $

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
nnoremap <leader>s :split<space>

" Basic commands
" All modes
noremap W :w<CR>

" Making split window easier
" All modes
noremap <C-u> <C-w>k
noremap <C-k> <C-w>l
noremap <C-j> <C-w>j
noremap <C-h> <C-w>h
noremap <C-]> <C-w>>
noremap <C-[> <C-w><
noremap <C-+> <C-w>+
noremap <C-_> <C-w>-
noremap <C-=> <C-w>=

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

noremap <leader>k :call Valign()<CR>
noremap <leader>h :call Halign()<CR>

" My Autopairing keymaps
let g:pair_dict ={'{':['{','}'],
			\'}':['{','}'],
			\'(':['(', ')'],
			\')':['(', ')'],
			\'[':['[', ']'],
			\']':['[', ']'],
			\'<':['<', '>'],
			\'>':['<', '>'],
			\'"':['"', '"'],
			\"'":["'", "'"],
			\'`':['`', '`']}

" Single line
" Brackets
inoremap {; {};<Left><Left>
inoremap (; ();<Left><Left>
inoremap [; [];<Left><Left>
inoremap <; <>;<Left><Left>
inoremap {, {},<Left><Left>
inoremap (, (),<Left><Left>
inoremap [, [],<Left><Left>
inoremap <, <>,<Left><Left>
inoremap {} {}<Left>
inoremap () ()<Left>
inoremap [] []<Left>
inoremap <> <><Left>

" Quotes
inoremap "" ""<Left>
inoremap '' ''<Left>
inoremap `` ``<Left>
inoremap "; "";<Left><Left>
inoremap '; '';<Left><Left>
inoremap `; ``;<Left><Left>
inoremap ", "",<Left><Left>
inoremap ', '',<Left><Left>
inoremap `, ``,<Left><Left>

" Multi-line
" Brackets
inoremap {<CR> {<CR>}<Esc>O
inoremap (<CR> (<CR>)<Esc>O
inoremap [<CR> [<CR>]<Esc>O
inoremap {;<CR> {<CR>};<Esc>O
inoremap (;<CR> (<CR>);<Esc>O
inoremap [;<CR> [<CR>];<Esc>O
inoremap {,<CR> {<CR>},<Esc>O
inoremap (,<CR> (<CR>),<Esc>O
inoremap [,<CR> [<CR>],<Esc>O

" Quotes
inoremap "<CR> "<CR>"<Esc>O
inoremap '<CR> '<CR>'<Esc>O
inoremap `<CR> `<CR>`<Esc>O
inoremap ```<CR> ```<CR>```<Esc>O
inoremap ";<CR> "<CR>";<Esc>O
inoremap ';<CR> '<CR>';<Esc>O
inoremap `;<CR> `<CR>`;<Esc>O

" Replace surrounding pairs
function ReplaceSurrounding()
	let s:input1 = nr2char(getchar())
	if s:input1 == "\<c-c>"
		return
	endif
	let s:first_pair = g:pair_dict[s:input1]
	let s:input2 = nr2char(getchar())
	if s:input2 == "\<c-c>"
		return
	endif
	let s:second_pair = g:pair_dict[s:input2]
	exec "norm di".s:first_pair[0]."r".s:second_pair[1]."br".s:second_pair[0]."p"
endfunction

nnoremap <silent> rs :call ReplaceSurrounding()<CR>

" Surround visually selected expressions with pairs
function SurroundWithPairs(curr_mode)
	let s:input = nr2char(getchar())
	if s:input == "\<c-c>"
		return
	endif
	let s:surr_pair = g:pair_dict[s:input]

	if a:curr_mode == 'v'
		exec "norm gv"
		exec "norm c".s:surr_pair[0].s:surr_pair[1]
		exec "norm p"
	elseif a:curr_mode == 'V'
		exec "'<,'>norm I".s:surr_pair[0]
		exec "'<,'>norm A".s:surr_pair[1]
	elseif a:curr_mode == 'c-v'
		exec "norm gvI".s:surr_pair[0]
		exec "norm gvkA".s:surr_pair[1]
	endif
endfunction

xno <silent> <expr> as {"v":	":call SurroundWithPairs('v')\<CR>",
					\ "V":		"\<Esc>:call SurroundWithPairs('V')\<CR>",
					\ "\<c-v>": "\<Esc>:call SurroundWithPairs('c-v')\<CR>",
					\ }[mode()]

" Delete surrounding pairs
function DeleteSurrounding(curr_mode)
	let s:del_char = nr2char(getchar())
	if s:del_char == "\<c-c>"
		return
	endif
	let s:del_pair = g:pair_dict[s:del_char][0]

	if a:curr_mode == 'n'
		exec "norm di".s:del_pair."bPw2x"
	elseif a:curr_mode == 'c-v'
		exec "'<,'>norm di".s:del_pair."bPw2x"
	endif
endfunction

xno <silent> <expr> ds {"\<c-v>": "\<Esc>:call DeleteSurrounding('c-v')\<CR>"}[mode()]
nnoremap <silent> ds :call DeleteSurrounding('n')<CR>
