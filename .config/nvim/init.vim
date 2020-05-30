" Inside these 'call lines' you can write 'Plug' instructions
" That specify each plugin you want to install
call plug#begin()

" Completion engine
Plug 'neoclide/coc.nvim', {'branch': 'release'}

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

" Vim-TMux navigator
"Plug 'christoomey/vim-tmux-navigator'

call plug#end()


" -----------------
" COC Configuration
" -----------------


" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Dunno what and why but ok
augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Functions needed for COC mappings
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}


" --------------------------------
" Vim-Tmux-Navigator configuration
" --------------------------------


"inoremap <silent> <C-h> <C-o>:TmuxNavigateLeft <CR>
"inoremap <silent> <C-j> <C-o>:TmuxNavigateDown <CR>
"inoremap <silent> <C-k> <C-o>:TmuxNavigateUp   <CR>
"inoremap <silent> <C-l> <C-o>:TmuxNavigateRight<CR>


" ---------------------
" Onedark configuration
" ---------------------


let g:onedark_terminal_italics=1


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
set scrolloff=6

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

" Use + register (X clipboard) for all copy/cut commands
set clipboard=unnamed

" Hide unmodified buffer if user leaves it
set hidden

" Leave more space for displaying messages (COC)
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Enable truecolor support if not in TTY
if $IN_TTY =~ '0'
	set termguicolors
else
	set notermguicolors
endif

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
" Don't change background (enables transparency)
hi Normal guibg=NONE ctermbg=NONE

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

" Remap X to delete a line
nmap <silent> X dd

" Remap Y to yank till the end of the line
nmap <silent> Y y$

" Remap dl to delete a character after the cursor
nmap <silent> dl lxh

" Center the view after moving to next search pattern
nmap <silent> n nzz
nmap <silent> N Nzz

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

" Mappings using CoCList:
" Show all diagnostics.
nnoremap <silent> <Leader>ca  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent> <Leader>ce  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent> <Leader>cc  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent> <Leader>co  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent> <Leader>cs  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <Leader>cj  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <Leader>ck  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent> <Leader>cp  :<C-u>CocListResume<CR>

" Use tab for trigger completion with characters ahead and navigate.
"
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)
