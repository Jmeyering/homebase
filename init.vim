call plug#begin('~/.vim/plugged')

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'danro/rename.vim'

"'sensible' defaults
Plug 'tpope/vim-sensible'

"code helpers
Plug 'editorconfig/editorconfig-vim'
Plug 'w0rp/ale'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'zchee/deoplete-go', { 'do': 'make'}
Plug 'tpope/vim-projectionist'

"text manipulation
Plug 'tpope/vim-surround'
Plug 'mattn/emmet-vim'
Plug 'godlygeek/tabular'

"search
Plug 'tpope/vim-vinegar'
Plug 'wincent/command-t', {
\   'do': 'cd ruby/command-t/ext/command-t && ruby extconf.rb && make'
\ }
Plug 'kshenoy/vim-signature'

"syntax highlight and colors
Plug 'fleischie/vim-styled-components'
Plug 'hail2u/vim-css3-syntax'
Plug 'iCyMind/NeoSolarized'
Plug 'pangloss/vim-javascript'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'lunaru/vim-twig'
Plug 'gregsexton/matchtag'
Plug 'plasticboy/vim-markdown'
Plug 'rodjek/vim-puppet'
Plug 'othree/html5.vim'
Plug 'StanAngeloff/php.vim'
Plug 'fatih/vim-go'


"git integration
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

call plug#end()

" -------------------------------------------------
"  important
" -------------------------------------------------
"Who cares about vi compatability
set nocompatible

" Allow netrw to remove non-empty local directories
let g:netrw_localrmdir='rm -r'

" -------------------------------------------------
"  moving around, searching and patterns
" -------------------------------------------------
"Ignore case in search mode
set ignorecase

"Do not ignore uppercase
set smartcase

"highlight search resules
set hlsearch

"Ignored directories
set wildignore+=*/cache/*,*/node_modules/*,*/vendor/*,*/craft/*

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
colorscheme NeoSolarized
set background=dark
let g:airline_solarized_bg='dark'

"show tabs and trailing spaces
set list listchars=tab:»·,trail:·
augroup ft_go
    au!

    au Filetype go setlocal tabstop=4 shiftwidth=4 softtabstop=4 noexpandtab
    au Filetype go setlocal listchars+=tab:\ \ 
augroup END

augroup FiletypeGroup
    autocmd!
    au BufNewFile,BufRead *.jsx set filetype=javascript.jsx
augroup END


let g:ale_linters = {
\   'jsx': ['stylelint', 'eslint'],
\   'go': ['go build']
\}

let g:ale_linter_aliases = {'jsx': 'css'}

" -------------------------------------------------
"  autocompletion
" -------------------------------------------------
let g:deoplete#sources#go#gocode_binary = '/home/vagrant/go/bin/gocode'
let g:deoplete#sources#go#use_cache = '~/.cache/deoplete/go/$GOOS_$GOARCH'
let g:deoplete#enable_at_startup = 1
autocmd CompleteDone * pclose!

" -------------------------------------------------
"  git integration
" -------------------------------------------------
let g:gitgutter_override_sign_column_highlight = 0

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
set mouse=

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
set formatoptions+=j

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
set nofoldenable

" -------------------------------------------------
"  diff mode
" -------------------------------------------------
" start diff mode with vertical splits by default
set diffopt+=vertical

" change split directions because it feels better to me that way.
set splitbelow
set splitright

" -------------------------------------------------
"  mapping
" -------------------------------------------------
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
set number relativenumber

augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
augroup END

"column to display the limit row
let &colorcolumn=join(range(80,999),",")

autocmd User ProjectionistDetect
\ call projectionist#append(getcwd(),
\ {
\   "src/components/*.spec.jsx": {
\     "alternate": "src/components/{}.jsx",
\     "type": "test"
\   },
\   "src/components/*.jsx": {
\     "alternate": "src/components/{}.spec.jsx",
\     "type": "source"
\   },
\ })
