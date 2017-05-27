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

Plugin 'VundleVim/Vundle.vim'

"'sensible' defaults
Plugin 'tpope/vim-sensible'

"code helpers
Plugin 'tobyS/pdv'
Plugin 'tobyS/vmustache'
Plugin 'SirVer/ultisnips'
Plugin 'joonty/vdebug'
Plugin 'Shougo/neocomplete.vim'
Plugin 'docteurklein/php-getter-setter.vim'
Plugin 'editorconfig/editorconfig-vim'

"text manipulation
Plugin 'tomtom/tcomment_vim'
Plugin 'tpope/vim-surround'
Plugin 'mattn/emmet-vim'
Plugin 'godlygeek/tabular'

"search
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'majutsushi/tagbar'

"syntax highlight and colors
Plugin 'fleischie/vim-styled-components'
Plugin 'hail2u/vim-css3-syntax'
Plugin 'altercation/vim-colors-solarized'
Plugin 'pangloss/vim-javascript'
Plugin 'maxmellon/vim-jsx-pretty'
Plugin 'lunaru/vim-twig'
Plugin 'gregsexton/matchtag'
Plugin 'plasticboy/vim-markdown'
Plugin 'rodjek/vim-puppet'
Plugin 'othree/html5.vim'
Plugin 'StanAngeloff/php.vim'
Plugin 'fatih/vim-go'

"syntax error checking
Plugin 'scrooloose/syntastic'
Plugin 'gcorne/vim-sass-lint'

"git integration
Plugin 'tpope/vim-fugitive'
Plugin 'mattn/webapi-vim'
Plugin 'mattn/gist-vim'

call vundle#end()
filetype on

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

"Ctrlp ignore folders
set wildignore+=*/cache/*,*/node_modules/*,*/vendor/*,*/craft/*

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
set list listchars=tab:»·,trail:·

augroup golang
    autocmd BufRead *.go set list listchars=tab:\ \ ,trail:·
augroup END

"PHPCs settings for :Phpcs command
let g:phpcs_std_list="PSR2"

"Set the checkers for Syntastic
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_javascript_eslint_exe = '$(npm bin)/eslint'
let g:syntastic_php_checkers=['php', 'phpcs', 'phpmd']
let g:syntastic_phpcs_conf="--standard=PSR2"
let g:syntastic_mode_map = { 'mode': 'active', 'passive_filetypes': ['go'] }

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

"Auto import go paths
let g:go_fmt_command = "goimports"

"map <leader>(gd) to godocumentation
au FileType go nmap <Leader>gd <Plug>(go-doc)

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
nmap <leader>sp :call <SID>SynStack()<CR>
function! <SID>SynStack()
  if !exists("*synstack")
    return
  endif
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc
