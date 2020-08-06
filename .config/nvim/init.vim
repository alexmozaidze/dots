" Loading plugins {{{
call plug#begin()
Plug 'junegunn/goyo.vim'
Plug 'svermeulen/vim-cutlass'
Plug 'tpope/vim-fugitive'
Plug 'junegunn/vim-easy-align'
Plug 'Raimondi/delimitMate'
Plug 'tpope/vim-eunuch'
Plug 'rafi/awesome-vim-colorschemes'
Plug 'sheerun/vim-polyglot'
Plug 'itchyny/lightline.vim'
"Plug 'alexmozaidze/vim-smoothie'
Plug '~/git/vim-smoothie'
Plug 'vim-syntastic/syntastic'
Plug 'pechorin/any-jump.vim'
Plug 'tpope/vim-unimpaired'
Plug 'AndrewRadev/sideways.vim'
call plug#end()
" }}}

" Standart NeoVim settings {{{
set path=.,,~/**,~/.local/**,~/.config/**,**
filetype plugin indent on
set noswapfile
set omnifunc=syntaxcomplete#Complete
syntax enable
set modelines=0
set incsearch inccommand=nosplit
set background=dark
set nowrap
set undofile
set textwidth=100 colorcolumn=101
set formatoptions=crqj
autocmd BufEnter *.vim,*.nvim setlocal formatoptions=crqj
autocmd BufEnter *.md,*.markdown,*.org setlocal formatoptions=tcrqn21jp
set tabstop=4 shiftwidth=4 noexpandtab shiftround
set scroll=0
set scrolloff=4
set sidescrolloff=4
set ignorecase
set shada=\'100,<9999,s100
set diffopt+=iwhite
set display=lastline
set shortmess=I
set clipboard=unnamedplus
set splitbelow splitright
set hidden
set termguicolors
set guicursor=o-cr-n-v-sm-r:block,c-i-ci-ve:ver25
set list listchars=tab:▏\ ,trail:-,nbsp:+,extends:,precedes:
set lazyredraw
set tm=86400000
set matchpairs+=<:>
set laststatus=2
set number relativenumber numberwidth=4
set noshowmode
set mouse=a
set nohlsearch
set cpo=adlABceF_
set nostartofline
set conceallevel=2
" }}}

" Gruvbox settings {{{
let g:gruvbox_italic = 1
let g:gruvbox_italicize_comments = 1
let g:gruvbox_italicize_strings = 1
let g:gruvbox_inverse = 0
" }}}
" Onedark settings {{{
let g:onedark_terminal_italics = 1
let g:onedark_hide_endofbuffer = 1
" }}}
colorscheme onedark

" Removing visual tweaks when in Terminal-mode {{{
autocmd TermEnter * set nolist nonumber norelativenumber | NoMatchParen
autocmd TermLeave * set list number relativenumber | DoMatchParen
" }}}

" Mapping leader
let mapleader=" "

" Removing <Leader> key's default behaviour {{{
nmap <silent> <Leader> <Nop>
nmap <silent> <Leader><Leader> <Nop>
" }}}

" Remapping x and s to cut and cut-change respectivly {{{
nnoremap x d
xnoremap x d
nnoremap xx dd
nnoremap X D

nnoremap s c
xnoremap s c
nnoremap ss cc
nnoremap S C
" }}}

" Fixing Y map
nmap <silent> Y y$

" Moving through splits with <C-direction> {{{
tnoremap <silent> <C-h> <C-\><C-n><C-w>h
tnoremap <silent> <C-j> <C-\><C-n><C-w>j
tnoremap <silent> <C-k> <C-\><C-n><C-w>k
tnoremap <silent> <C-l> <C-\><C-n><C-w>l
inoremap <silent> <C-h> <C-\><C-n><C-w>h
inoremap <silent> <C-j> <C-\><C-n><C-w>j
inoremap <silent> <C-k> <C-\><C-n><C-w>k
inoremap <silent> <C-l> <C-\><C-n><C-w>l
nnoremap <silent> <C-h> <C-w>h
nnoremap <silent> <C-j> <C-w>j
nnoremap <silent> <C-k> <C-w>k
nnoremap <silent> <C-l> <C-w>l
" }}}

" Quitting Terminal-mode with <Esc> {{{
tnoremap <silent> <Esc> <C-\><C-n>
" }}}

" Maps for saving {{{
nnoremap <silent> <Leader>w :confirm w<CR>
nnoremap <silent> <Leader>W :confirm wa<CR>
nnoremap <silent> <Leader>u :SudoWrite<CR>
" }}}

" Maps for quitting {{{
nnoremap <silent> <Leader>q :confirm q<CR>
nnoremap <silent> <Leader>Q :confirm qa<CR>
" }}}

" Maps for quitting&saving {{{
nnoremap <silent> <Leader>s :wq<CR>
nnoremap <silent> <Leader>S :wqa<CR>
" }}}

" Maps for killing buffer(s) {{{
nnoremap <silent> <Leader>k :bd!<CR>
nnoremap <silent> <Leader>K :bd!<CR>
" }}}

" Function and command wrapper for it for evaluating current buffer's contents {{{
function EvalBuf() abort
	let l:userInput = input("Interpreter to use: ", "", "shellcmd") . "\n"
	if trim(l:userInput) ==# ""
		return
	endif
	echo "\n" . system(l:userInput, join(getline(1, '$'), "\n"))
endfunction
command! EvalBuf call EvalBuf()
" }}}

" Map scratch buffer
nnoremap <silent> <Leader>x :15new<CR>:setlocal buftype=nofile bufhidden=hide noswapfile<CR>

" TODO: Add functionality for automatic evaluation
" Maps for evaluating buffer content {{{
nnoremap <silent> <Leader>e :EvalBuf<CR>
" }}}

" Argument text object mappings {{{
omap <silent> aa <Plug>SidewaysArgumentTextobjA
xmap <silent> aa <Plug>SidewaysArgumentTextobjA
omap <silent> ia <Plug>SidewaysArgumentTextobjI
xmap <silent> ia <Plug>SidewaysArgumentTextobjI
" }}}

" Easy-Align mapings {{{
xmap ga <Plug>(LiveEasyAlign)
nmap ga <Plug>(LiveEasyAlign)
" }}}

" Goyo map
nnoremap <silent> <Leader>c :Goyo<CR>

" Vim-Markdown settings {{{
let g:vim_markdown_no_default_key_mappings = 0
let g:vim_markdown_folding_disabled = 0
let g:vim_markdown_conceal = 2
let g:vim_markdown_conceal_code_blocks = 0
let g:vim_markdown_math = 1
let g:vim_markdown_toml_frontmatter = 1
let g:vim_markdown_strikethrough = 1
let g:vim_markdown_autowrite = 1
let g:vim_markdown_edit_url_in = "tab"
let g:vim_markdown_follow_anchor = 1
" }}}
" Smoothie settings {{{
let g:smoothie_update_interval=10
" }}}

" Goyo settings {{{
function! s:goyo_enter()
	set sidescrolloff=2 colorcolumn=101
	norm zz
	hi NonText gui=NONE guibg=NONE guifg=#3B4048
endfunction
function! s:goyo_leave()
	set number relativenumber
	norm zz
	hi EndOfBuffer gui=NONE guibg=default guifg=#282C34
endfunction
autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()

let g:goyo_width = "50%"
let g:goyo_height = "85%"
" }}}

" Syntastic settings {{{
let g:syntastic_always_populate_loc_list=1
let g:syntastic_auto_loc_list=0
let g:syntastic_check_on_open=1
let g:syntastic_check_on_wq=0
" }}}

" Lightline settings {{{
let g:lightline = {}
let g:lightline.colorscheme = 'onedark'
let g:lightline.separator =    { 'left': ' ', 'right': ' ' }
let g:lightline.subseparator = { 'left': '│', 'right': '│' }
let g:lightline.tabline_separator =    { 'left': '', 'right': '' }
let g:lightline.tabline_subseparator = { 'left': '', 'right': '' }
let g:lightline.tabline = { 'left': [ [ 'tabs' ] ], 'right': [ [ '' ] ] }
" }}}

" DelimitMate settings {{{
let delimitMate_expand_inside_quotes = 1
let delimitMate_expand_cr = 1
let delimitMate_expand_space = 1
let delimitMate_autoclose = 1
let delimitMate_excluded_regions = "Comment"
" }}}
