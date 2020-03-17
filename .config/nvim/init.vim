" Inside these 'call lines' you can write 'Plug' instructions
" That specify each plugin you want to install
call plug#begin()

" Automatic closing of quotes, brackets, e.t.c.
Plug 'Raimondi/delimitMate'

" Some handy commands
Plug 'tpope/vim-eunuch'

" Some cool colorschemes
Plug 'rafi/awesome-vim-colorschemes'

" A collection of language packs
Plug 'sheerun/vim-polyglot'

" Cool lookin' statusline 😎
Plug 'itchyny/lightline.vim'

" Smooth scroll plugin
Plug 'terryma/vim-smooth-scroll'

" Syntax checker
Plug 'vim-syntastic/syntastic'

call plug#end()


" ---------------------
" Onedark configuration
" ---------------------


let g:onedark_terminal_italics=1


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


" --------------------------
" DelimitMate configurations
" --------------------------


" Auto indent if pressed enter inside brackets
let delimitMate_expand_cr=1


" --------------------------
" General Vim configurations
" --------------------------


" Where to search for files (for instance when :find command is used)
set path=.,,.local/**,.config/**,**

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

" Ignore letters case
set ignorecase

" Store info from no more than 100 files at a time, 9999 lines of text, 100kb of data.
" Useful for copying large amounts of data between files.
set shada=\'100,<9999,s100

" Avoid whitespace comparison in diff mode
set diffopt+=iwhite

" Show everything that can fit when the text doesn't fit
set display=lastline

" Make some messages shorter (also removes the annoying intro message)
set shortmess=aWIc

" Use * register for all copy/cut commands
set clipboard=unnamed

" Hide unmodified buffer if user leaves it
set hidden

" Enable truecolor support
set termguicolors

" Change cursor shape in different modes
set guicursor=o-cr-n-v-sm-r:block,c-i-ci-ve:ver25

" Display tabs as '▏   '
set list
set listchars=tab:▏\ 

" Do not redraw screen while executing macros, mappings, e.t.c.
set lazyredraw

" Time in milliseconds to wait for a mapped sequence to complete
"
" NOTE:
" 86400000 milliseconds is 1 day lol
set tm=86400000

" Highlight matching pairs of brackets
" Use the '%' character to jump between them.
set matchpairs+=<:>

" Always display statusline
set laststatus=2

" Change colorscheme
colo onedark

" Show line numbers
set number
" Show relative line numbers
set relativenumber
" Numbers will be at least N characters wide
set numberwidth=4

" Disable mode showing
set noshowmode

" No lines indentation and line numbers in terminal mode
autocmd TermEnter * set nolist nonumber norelativenumber
autocmd TermLeave * set list number relativenumber

" Makes some characters dissapear or replaces them in order for text to look better.
" Effect doesn't appear on the line the cursor is on because concealcursor is empty.
"
" NOTE:
" IndentLine overrides your values when active,
" be sure to change values not only here but in the indentLine's
" configurations as well, otherwise conceal will be different.
set conceallevel=2
set concealcursor=""

" Function for viewing difference between current buffer and an actual file
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

" Unmap <Space> and make <Space> act like <Space>
nmap <Space> <Nop>

" Remap X to delete a line
nnoremap <silent> X dd

" Remap Y to yank till the end of the line
nnoremap <silent> Y y$

" Remap dl to delete a character after the cursor
nnoremap <silent> dl lxh

" Remap <C-e> to move the cursor to the end of the line
inoremap <silent> <C-e> <C-o>$

" Remap <C-a> to move the cursor to the begining of the line
inoremap <silent> <C-a> <C-o>^

" Map for saving a file
nnoremap <silent> <Space>w :confirm w<CR>
nnoremap <silent> <Space>W :SudoWrite<CR>

" Map for quitting a file (or closing a pane)
nnoremap <silent> <Space>q :confirm q<CR>
nnoremap <silent> <Space>Q :confirm qa<CR>

" Map for save&quit
nnoremap <silent> <Space>s :confirm wq<CR>
nnoremap <silent> <Space>S :confirm wqa<CR>

" Map for re-editing current file (if changes was made outside of Vim this is useful)
nnoremap <silent> <Space>e :e<CR>
nnoremap <silent> <Space>E :e!<CR>

" Map for toggling the indentation lines of the current buffer
nnoremap <silent> <Space><Tab> :set invlist<CR>

" Map for toggling lines numbers
nnoremap <silent> <Space>n :set invnumber invrelativenumber<CR>

" Map for removing highlights of search patterns
nnoremap <silent> <Space>h :noh<CR>

" Map for document indentation
nnoremap <silent> <Space>i gg=G<C-o>

" Map for detecting filetype
nnoremap <silent> <Space>f :filetype detect<CR>

" Map for fixing syntax highlight and redrawing the screen
nnoremap <silent> <Space>r :syntax sync fromstart<CR>:mode<CR>

" Maps for smooth scrolling
nnoremap <silent> <C-u> :call smooth_scroll#up  (&scroll,   18, 2)<CR>
nnoremap <silent> <C-d> :call smooth_scroll#down(&scroll,   18, 2)<CR>

nnoremap <silent> <C-b> :call smooth_scroll#up  (&scroll*2, 20, 4)<CR>
nnoremap <silent> <C-f> :call smooth_scroll#down(&scroll*2, 20, 4)<CR>

" Maps for moving throught document when using 1 hand
"
" NOTE:
" Those mappings are made so that I can scratch my back and view the codebase
" at the same time
nnoremap <silent> <Left> :call smooth_scroll#up   (&scroll,   18, 2)<CR>
nnoremap <silent> <Right> :call smooth_scroll#down(&scroll,   18, 2)<CR>
nnoremap <silent> <Up> <C-y>k
nnoremap <silent> <Down> <C-e>j
