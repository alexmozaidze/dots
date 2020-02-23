" Inside these 'call lines' you can write 'Plug' instructions
" That specify each plugin you want to install
call plug#begin('~/.vim/plugged')

" Automatic closing of quotes, brackets, e.t.c.
Plug 'Raimondi/delimitMate'

" Lines indentation
Plug 'Yggdroot/indentLine'

" Some handy commands for Vim
Plug 'tpope/vim-eunuch'

" Some cool colorschemes for Vim
Plug 'rafi/awesome-vim-colorschemes'

" A collection of language packs for Vim
Plug 'sheerun/vim-polyglot'

" Cool lookin' statusline 😎
Plug 'itchyny/lightline.vim'

" Emmet, for fast HTML work
Plug 'mattn/emmet-vim'

" Fzf, for fast files search
Plug 'junegunn/fzf', { 'do': './install --bin' }
Plug 'junegunn/fzf.vim'

" Vim-Tmux navigator, for faster split-switching
Plug 'christoomey/vim-tmux-navigator'

" Smooth scroll plugin
Plug 'terryma/vim-smooth-scroll'

" Syntax checker
Plug 'vim-syntastic/syntastic'

call plug#end()


" -----------------------
" Syntastic configuration
" -----------------------


set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list=1
let g:syntastic_auto_loc_list=1
let g:syntastic_check_on_open=1
let g:syntastic_check_on_wq=0

let g:syntastic_javascript_checkers=['eslint']
let g:syntastic_c_checkers=['gcc']


" ------------------------
" Lightline configurations
" ------------------------


let g:lightline = {
  \ 'colorscheme': 'onedark',
  \ }


" --------------------
" Netrw configurations
" --------------------


" Remove the banner
let g:netrw_banner=0

" Tree listing layout
let g:netrw_liststyle=3

" Open files in current viewport
let g:netrw_browse_split=0

" If opened in split, netrw will take 25% of the space
let g:netrw_winsize=25


" --------------------
" Emmet configurations
" --------------------


" Leader key.
"
" NOTE:
" You'll still need to type a comma for completion
let g:user_emmet_leader_key='<C-q>'

" Make Emmet work only in normal and insert modes
let g:user_emmet_mode='ni'


" --------------------------
" DelimitMate configurations
" --------------------------


" Auto indent if pressed enter inside brackets
let delimitMate_expand_cr=1


" -------------------------
" IndentLine configurations
" -------------------------


" Levels separator
let g:indentLine_char='▏'

" 0 = use colorscheme default color for conceal
" 1 = use custom color for conceal
let g:indentLine_setColors=1

" IMPORTANT:
" IndentLine overrides your conceallevel/concealcursor values when active
let g:indentLine_concealcursor=""
let g:indentLine_conceallevel=2

" Disable indentLine for JSON
let g:vim_json_syntax_conceal=0

" Disable lines indentation on help pages and emacs lisp files
autocmd Filetype help,el IndentLinesDisable


" --------------------------
" General Vim configurations
" --------------------------


" Search down into subfolders
" Provides tab-completion for all file-related tasks
set path+=**

" Provide a menu when tab-completing in cmd mode
set wildmenu

" Allow filetype detection, plugins and indentation
filetype plugin indent on

" Enable omni completion
set omnifunc=syntaxcomplete#Complete

" Turn on syntax highlighting.
syntax enable

" Turn off modelines
set modelines=0

" Terminal's background color
set background=dark

" Automaticaly wrap text that extends beyond the screen length
set wrap

" Formatting options
set formatoptions=nr1

" Configuration for tab indentation
set tabstop=4
set shiftwidth=4
set noexpandtab
set shiftround

" Minimal number of screen lines to keep above and below the cursor
"
" NOTE:
" High number like 999 will make the cursor to always be in the middle
set scrolloff=0

" Fixes common backspace problems
set backspace=indent,eol,start

" Display what command you type
set showcmd

" Encoding
set encoding=utf-8

" Search while typing
set incsearch

" Highlight matching search patterns
set hlsearch

" Include matching uppercase words with lowercase search term
set ignorecase

" Store info from no more than 100 files at a time, 9999 lines of text, 100kb of data.
" Useful for copying large amounts of data between files.
set viminfo='100,<9999,s100

" Avoid whitespace comparison in diff mode
set diffopt+=iwhite

" Show everything that can fit when the text doesn't fit
set display=lastline

" Allow going out of bounds in Visual-Block
set virtualedit=block

" Make some messages shorter (also removes the annoying intro message)
set shortmess=aWIc

" Use Vim's own clipboard
set clipboard=unnamed

" Hide the unmodified buffer if user leaves it
set hidden

" Remove the lag for <Esc> key
set tm=0
set ttm=-1

" Change cursor shape in different modes
if $IN_TTY!=1
	let &t_SI.="\e[5 q"
	let &t_SR.="\e[1 q"
	let &t_EI.="\e[1 q"
else
	let &t_SI.="\e[?2c"
	let &t_SR.="\e[?6c"
	let &t_EI.="\e[?6c"
endif

" Function for switching to diff mode
" :diffoff to disable diff mode for current buffer
function! s:DiffWithSaved()
	let filetype=&ft
	diffthis
	vnew | r # | normal! 1Gdd
	diffthis
	exe "setlocal bt=nofile bh=wipe nobl noswf ro ft=" . filetype
endfunction
" Command to call function above
command! DiffSaved call s:DiffWithSaved()

" Display tabs as '▏   '
set list
set listchars=tab:▏\ 

" Highlight matching pairs of brackets
" Use the '%' character to jump between them.
set matchpairs+=<:>

" Always display statusline
set laststatus=2

" Change to atom-like colorscheme
colorscheme onedark

" Show line numbers
set number
" Show relative line numbers
set relativenumber

" Enable mode showing
set noshowmode

" Show tabs only if there's more than one tab
set showtabline=2

" Makes some characters dissapear or replaces them in order for text to look better.
" Effect doesn't appear on the line the cursor is on because concealcursor is empty.
"
" WARNING:
" IndentLine overrides your values when active,
" be sure to change values not only here but in the indentLine's
" configurations as well, otherwise conceal will be different.
set conceallevel=2
set concealcursor=""

" Maps for toggling the indent lines of the current buffer
nnoremap <silent> <F1> :IndentLinesToggle<CR>:set invlist<CR>
inoremap <silent> <F1> <C-o>:IndentLinesToggle<CR><C-o>:set invlist<CR>

" Vim's auto indentation feature doesn't work properly with text copied from
" Outside of Vim. Press the <F2> key to toggle paste mode on/off
set pastetoggle=<F2>

" Maps for toggling lines numbers
nnoremap <silent> <F3> :set invnumber invrelativenumber<CR>
inoremap <silent> <F3> <C-o>:set invnumber invrelativenumber<CR>

" Maps for removing highlights of search patterns
nnoremap <silent> <F4> :noh<CR>
inoremap <silent> <F4> <C-o>:noh<CR>

" Maps for fixing syntax highlight
nnoremap <silent> <F5> :syntax sync fromstart<CR>
inoremap <silent> <F5> <C-o>:syntax sync fromstart<CR>

" Maps for detecting filetype
nnoremap <silent> <F6> :filetype detect<CR>
inoremap <silent> <F6> <C-o>:filetype detect<CR>

" Maps for moving throught document when using 1 hand
"
" NOTE:
" Those mappings are useless if you're not scratching
" your nose for 10 hours nonstop like I do
nnoremap <silent> <Up> <C-y>H0
nnoremap <silent> <Down> <C-e>H0
nnoremap <silent> <Left> HggH0
nnoremap <silent> <Right> LGH0

" Maps for smooth scrolling
noremap <silent> <C-u> :call smooth_scroll#up  (&scroll,   18, 2)<CR>
noremap <silent> <C-d> :call smooth_scroll#down(&scroll,   18, 2)<CR>

noremap <silent> <C-b> :call smooth_scroll#up  (&scroll*2, 20, 4)<CR>
noremap <silent> <C-f> :call smooth_scroll#down(&scroll*2, 20, 4)<CR>
