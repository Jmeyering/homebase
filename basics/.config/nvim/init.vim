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
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'tobyS/pdv'
Plug 'tobys/vmustache'
Plug 'Ivo-Donchev/vim-react-goto-definition'
Plug 'posva/vim-vue'

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
Plug 'hashivim/vim-terraform'
Plug 'styled-components/vim-styled-components'
Plug 'chrisbra/Colorizer'
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
Plug 'sebdah/vim-delve'
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
Plug 'sheerun/vim-polyglot'


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

augroup ft_php
    au!

    au Filetype php setlocal tabstop=4 shiftwidth=4 softtabstop=4
augroup END

augroup ft_jsx
    autocmd!
    au BufNewFile,BufRead *.jsx set filetype=javascript.jsx
augroup END


let g:ale_linters = {
\   'jsx': ['stylelint', 'eslint'],
\   'php': ['phpcs'],
\   'go': ['gofmt', 'golint', 'go vet', 'go build']
\}

let g:ale_linter_aliases = {
\   'jsx': 'css'
\}

let g:ale_fixers = {
\    'javascript': ['prettier'],
\    'vue': ['prettier'],
\    'php': ['phpcbf']
\}
let g:ale_javascript_prettier_options = '--trailing-comma all --write'
let g:ale_php_phpcs_standard = 'psr2'
let g:ale_php_phpcbf_standard = 'psr2'
let g:ale_fix_on_save = 1


" -------------------------------------------------
"  autocompletion
" -------------------------------------------------

autocmd FileType js UltiSnipsAddFiletypes javascript-react
let g:UltiSnipsSnippetDirectories = ['~/.config/nvim/UltiSnips', 'UltiSnips']

let g:pdv_template_dir = $HOME ."/.config/nvim/UltiSnips/pdv"
nnoremap <leader>d :call pdv#DocumentWithSnip()<CR>

set completeopt=longest,menuone
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

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
set tabstop=2
"Spaces not tabs
set shiftwidth=2
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
au FileType go nmap <leader>gd <Plug>(go-doc)

au FileType go nmap <leader>b :DlvToggleBreakpoint<cr>
au FileType go nmap <leader>r :DlvToggleTracepoint<cr>

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
let &colorcolumn=join(range(81,2000),",")

let g:user_emmet_settings = {
\  'javascript.jsx' : {
\      'extends': 'jsx',
\  },
\}
