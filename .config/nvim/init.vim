" Inside these 'call lines' you can write 'Plug' instructions
" That specify each plugin you want to install
call plug#begin()

" Tags manager
Plug 'junegunn/goyo.vim'

" Tags manager
Plug 'svermeulen/vim-gutentags'

" Delete commands are not saving the deleted text anymore.vim
Plug 'svermeulen/vim-cutlass'

" Git commands in Vim
Plug 'tpope/vim-fugitive'

" Easy aligning
Plug 'junegunn/vim-easy-align'

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
Plug 'psliwka/vim-smoothie'

" Syntax checker
Plug 'vim-syntastic/syntastic'

call plug#end()


" ---------------------------
" Smooth scroll configuration
" ---------------------------


let g:smoothie_update_interval=10


" -----------------------
" Gutentags configuration
" -----------------------


function! s:goyo_enter()
	if executable('tmux') && strlen($TMUX)
		silent !tmux list-panes -F '\#F' | grep -q Z || tmux resize-pane -Z
	endif
	set showmode
	set showcmd
	set nocul
	norm zz
	Goyo 60%x100%
	hi NonText gui=NONE guibg=NONE guifg=#3B4048
endfunction

function! s:goyo_leave()
	if executable('tmux') && strlen($TMUX)
		silent !tmux list-panes -F '\#F' | grep -q Z && tmux resize-pane -Z
	endif
	set noshowmode
	set cul
	"bufdo set number relativenumber
	norm zz
	" Remove background color
	hi Normal guibg=NONE ctermbg=NONE
	" Remove tildas from the end of buffer
	hi EndOfBuffer gui=NONE guibg=default guifg=#282C34
endfunction

autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()

let g:goyo_width="90%"
let g:goyo_height="100%"
let g:goyo_linenr="0"


" -----------------------
" Gutentags configuration
" -----------------------


" Make cscope git to work
let g:gutentags_modules=[ "cscope" ]
let g:gutentags_auto_add_gtags_cscope=1


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
let g:syntastic_c_checkers=["make"]


" ------------------------
" Lightline configurations
" ------------------------


" Making an option object for further changes
let g:lightline = {}

" Colorscheme
let g:lightline.colorscheme = 'onedark'

" Statusline separators
let g:lightline.separator =    { 'left': ' ', 'right': ' ' }
let g:lightline.subseparator = { 'left': '│', 'right': '│' }

" Tabline separators
let g:lightline.tabline_separator =    { 'left': '', 'right': '' }
let g:lightline.tabline_subseparator = { 'left': '', 'right': '' }

" Remove background color from statusline
let s:palette = g:lightline#colorscheme#{g:lightline.colorscheme}#palette
let s:palette.normal.middle = [ [ 'NONE', 'NONE', 'NONE', 'NONE' ] ]
let s:palette.inactive.middle = s:palette.normal.middle
let s:palette.tabline.middle = s:palette.normal.middle


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
set path=.,,~/**,~/.local/**,~/.config/**,**

" Allow filetype detection, plugins and indentation
filetype plugin indent on

" Making Vim behave the same in Russian and US layouts
set langmap=ФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯ;ABCDEFGHIJKLMNOPQRSTUVWXYZ,фисвуапршолдьтщзйкыегмцчня;abcdefghijklmnopqrstuvwxyz

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

" Wrapmargin
set wrapmargin=1

" Formatting options
set formatoptions=tcrwnl1jp

" Configuration for tab indentation
set tabstop=4
set shiftwidth=4
set noexpandtab
set shiftround

" Set scroll variable to half of the screen size
set scroll=0

" Minimal number of screen lines to keep above and below the cursor
set scrolloff=9999

" Ignore letters case
set ignorecase

" Store info from no more than 100 files at a time, 9999 lines of text, 100kb of data.
" Useful for copying large amounts of data between files.
set shada=\'100,<9999,s100

" Avoid whitespace comparison in diff mode
set diffopt+=iwhite

" Highlight the line cursor is on
set cul

" Show everything that can fit when the text doesn't fit
set display=lastline

" Make some messages shorter (also removes the annoying intro message)
set shortmess=aWIc

" Use + register (X clipboard) for all copy/cut commands
set clipboard=unnamedplus

" Hide unmodified buffer if user leaves it
set hidden

" Enable truecolor
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
" Remove background color
hi Normal guibg=NONE ctermbg=NONE
" Remove tildas from the end of buffer
hi EndOfBuffer cterm=NONE ctermbg=black ctermfg=black gui=NONE guibg=default guifg=#282C34

" Hard line breaks
set textwidth=100

" Highlight the maximum length of line
set colorcolumn=100

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

" Automaticaly center the view after resizing Vim
autocmd VimResized * norm zz

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

let mapleader=" "

" Unmap <Space> and <Space><Space>
nmap <silent> <Space> <Nop>
nmap <silent> <Space><Space> <Nop>

" Remap U to redo the changes
nmap <silent> U <C-r>

" Remap x key to act as native dd (default behaviour changed by cutlass plugin)
nnoremap x d
xnoremap x d

nnoremap xx dd
nnoremap X D

" Remap Y to yank till the end of the line
nmap <silent> Y y$

" Center the view after in jump list
nmap <silent> <C-o> <C-o>zz
nmap <silent> <C-i> <C-i>zz

nnoremap <silent> <Leader>w :confirm w<CR>
nnoremap <silent> <Leader>W :confirm wa<CR>
nnoremap <silent> <Leader><Leader>w :SudoWrite<CR>
nnoremap <silent> <Leader><Leader>W :SudoWrite<CR>

nnoremap <silent> <Leader>q :confirm q<CR>
nnoremap <silent> <Leader>Q :confirm qa<CR>

nnoremap <silent> <Leader>s :wq<CR>
nnoremap <silent> <Leader>S :wqa<CR>

" Map for toggling the indentation lines of the current buffer
nnoremap <silent> <Leader><Tab> :set invlist<CR>

" Map for removing highlights of search patterns
nnoremap <silent> <Leader>h :noh<CR>

" Map for document indentation
nnoremap <silent> <Leader>i gg=G<C-o>

" Map for detecting filetype
nnoremap <silent> <Leader>f :filetype detect<CR>

" Map for fixing syntax highlight and redrawing the screen
nnoremap <silent> <Leader>r :syntax sync fromstart<CR>:mode<CR>

" use both cscope and ctag for 'ctrl-]', ':ta', and 'vim -t'
set cscopetag

" check cscope for definition of a symbol before checking ctags: set to 1
" if you want the reverse search order.
set csto=0

" s symbol: find all references to the token under cursor
" g global: find global definition(s) of the token under cursor
" c calls:  find all calls to the function name under cursor
" t text:   find all instances of the text under cursor
" e egrep:  egrep search for the word under cursor
" f file:   open the filename under cursor
" i includes: find files that include the filename under cursor
" d called: find functions that function under cursor calls
nmap <C-Space>s :cs find s <C-R>=expand("<cword>")<CR><CR>	
nmap <C-Space>g :cs find g <C-R>=expand("<cword>")<CR><CR>	
nmap <C-Space>c :cs find c <C-R>=expand("<cword>")<CR><CR>	
nmap <C-Space>t :cs find t <C-R>=expand("<cword>")<CR><CR>	
nmap <C-Space>e :cs find e <C-R>=expand("<cword>")<CR><CR>	
nmap <C-Space>f :cs find f <C-R>=expand("<cfile>")<CR><CR>	
nmap <C-Space>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
nmap <C-Space>d :cs find d <C-R>=expand("<cword>")<CR><CR>

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" Goyo mapping
nnoremap <Leader>c :Goyo<CR>
