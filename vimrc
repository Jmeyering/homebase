" -------------------------------------------------
" Encoding issues with windows machines. Require utf8
" -------------------------------------------------
if has("multi_byte")
    if &termencoding == ""
        let &termencoding = &encoding
    endif
    set encoding=utf-8
    setglobal fileencoding=utf-8
    "setglobal bomb
    set fileencodings=ucs-bom,utf-8,latin1
endif

" -------------------------------------------------
" vundle
" -------------------------------------------------
filetype off "required for Vundle. we turn back on after
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/vundle'

"'sensible' defaults
Plugin 'tpope/vim-sensible'

"code helpers
Plugin 'tobyS/pdv'
Plugin 'tobyS/vmustache'
Plugin 'SirVer/ultisnips'
Plugin 'joonty/vdebug'

"text manipulation
Plugin 'Jmeyering/SwapLines'
Plugin 'tomtom/tcomment_vim'
Plugin 'tpope/vim-surround'
Plugin 'mattn/emmet-vim'
Plugin 'godlygeek/tabular'

"search
Plugin 'kien/ctrlp.vim'
Plugin 'scrooloose/nerdtree'

"syntax highlight and colors
Plugin 'altercation/vim-colors-solarized'
Plugin 'lunaru/vim-twig'
Plugin 'gregsexton/matchtag'
Plugin 'plasticboy/vim-markdown'
Plugin 'rodjek/vim-puppet'
Plugin 'othree/html5.vim'

"syntax error checking
Plugin 'scrooloose/syntastic'
Plugin 'wookiehangover/jshint.vim'

"git integration
Plugin 'tpope/vim-fugitive'
Plugin 'mattn/webapi-vim'
Plugin 'mattn/gist-vim'

call vundle#end()
filetype on

" -------------------------------------------------
" pathogen
" -------------------------------------------------
call pathogen#helptags() "pathogen
execute pathogen#infect()

" -------------------------------------------------
"  important
" -------------------------------------------------
"Who cares about vi compatability
set nocompatible

" -------------------------------------------------
"  moving around, searching and patterns
" -------------------------------------------------
"ctrlp search mode
let g:ctrlp_working_path_mode = 'r'
"ctrlp shortcut
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
"Ctrlp ignore folders
set wildignore+=*/cache/*,*/node_modules/*,*/vendor/*
"Ignore case in search mode
set ignorecase
"Do not ignore uppercase
set smartcase
"highlight search resules
set hlsearch

" -------------------------------------------------
"  tags
" -------------------------------------------------

" -------------------------------------------------
"  displaying text
" -------------------------------------------------

" -------------------------------------------------
"  syntax, highlighting and spelling
" -------------------------------------------------
"Enable Syntax Highlighting
syntax on
set background=dark
"allow the terminal to display transparent when necessary
try
    let g:solarized_termtrans = 1

    "Turn off all the rediculous formatting
    let g:solarized_italic=0
    let g:solarized_bold=0
    let g:solarized_underline=0
    "YAY Solarized
    colorscheme solarized
catch /^Vim\%((\a\+)\)\=:E185/
endtry

"show tabs and trailing spaces
set list listchars=tab:»·,trail:þ

"PHPCs settings for :Phpcs command
let g:phpcs_std_list="PSR2"

"Set the checkers for Syntastic
let g:syntastic_php_checkers=['php', 'phpcs', 'phpmd']
"the coding standard for Syntastic
let g:syntastic_phpcs_conf="--standard=PSR2"

" -------------------------------------------------
"  multiple windows
" -------------------------------------------------

" -------------------------------------------------
"  multiple tab pages
" -------------------------------------------------
map <c-t> :tabnew<CR>

" -------------------------------------------------
"  terminal
" -------------------------------------------------
set ttyfast

" -------------------------------------------------
"  using the mouse
" -------------------------------------------------

" -------------------------------------------------
"  printing
" -------------------------------------------------

" -------------------------------------------------
"  messages and info
" -------------------------------------------------

" -------------------------------------------------
"  selecting text
" -------------------------------------------------

" -------------------------------------------------
"  editing text
" -------------------------------------------------
if v:version > 703 || v:version == 703 && has("patch541")
    " delete comment char on second line when  joining two commented lines
    set formatoptions+=j
endif

" -------------------------------------------------
"  tabs and indenting
" -------------------------------------------------
"Dur
set tabstop=4
"Spaces not tabs
set shiftwidth=4
"Change existing tabs to spaces
set expandtab

" -------------------------------------------------
"  folding
" -------------------------------------------------
if has('folding')
    " When opening files, all folds open by default
    set nofoldenable
endif

" -------------------------------------------------
"  diff mode
" -------------------------------------------------
" start diff mode with vertical splits by default
set diffopt+=vertical

" -------------------------------------------------
"  mapping
" -------------------------------------------------
"NERDTree mapping
map <C-n> :NERDTreeToggle<CR>
"command to add doc blocks
autocmd FileType php noremap <TAB> <ESC>:call pdv#DocumentWithSnip()<CR>
"Split lines at cursor with K
noremap K i<CR><ESC>
"Only lint js on save
let JSHintUpdateWriteOnly=1
" -------------------------------------------------
"  reading and writing files
" -------------------------------------------------
"Dont ask for confirmation on save
set autowrite
"Hides current buffer when new buffer is open
set hidden

" -------------------------------------------------
"  the swap file
" -------------------------------------------------

" -------------------------------------------------
"  command line editing
" -------------------------------------------------

" -------------------------------------------------
"  executing external commands
" -------------------------------------------------

" -------------------------------------------------
"  running make and jumping to errors
" -------------------------------------------------

" -------------------------------------------------
"  language specific
" -------------------------------------------------
"Detect Syntax settings
filetype plugin indent on

" -------------------------------------------------
"  multi-byte characters
" -------------------------------------------------

" -------------------------------------------------
"  various
" -------------------------------------------------
"Show numbers in the gutter
set number
"column to display the limit row
set colorcolumn=80

"let PDV know the directory of my snippets
if has('gui_running')
    let g:pdv_template_dir = $HOME ."\\vimfiles\\bundle\\pdv\\templates_snip"
else
    let g:pdv_template_dir = $HOME ."/.vim/bundle/pdv/templates_snip"
endif

"In gui mode  stuff
if has('gui_running')
    "pretty fonts
    set guifont=Inconsolata\ 12
    "turn off toolbars and other nonsense
    set guioptions=
endif
