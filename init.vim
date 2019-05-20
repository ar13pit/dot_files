""""""" Plugin management stuff """""""
set nocompatible
filetype off

set rtp+=~/.config/nvim/bundle/Vundle.vim
call vundle#begin('~/.config/nvim/bundle')

Plugin 'VundleVim/Vundle.vim'

" Custom plugins...
" Code folding
Plugin 'tmhedberg/SimpylFold'
" Ctrl-P - Fuzzy file search
Plugin 'kien/ctrlp.vim'
" Autocomplete for python
Plugin 'Valloric/YouCompleteMe'
" File browsing
Plugin 'scrooloose/nerdtree'
" Git plugin
Plugin 'tpope/vim-fugitive'
" Syntax check
"Plugin 'vim-syntastic/syntastic'
" Tags
Plugin 'xolox/vim-misc'
Plugin 'xolox/vim-easytags'
Plugin 'majutsushi/tagbar'

" Remove extraneous whitespace when edit mode is exited
"Plugin 'thirtythreeforty/lessspace.vim'

" Screen splitter.  Cool, but doesn't work with nvim.
"Plugin 'ervandew/screen'

" Neomake build tool (mapped below to <c-b>)
"Plugin 'benekastah/neomake'

" EasyMotion - Allows <leader><leader>(b|e) to jump to (b)eginning or (end)
" of words.
"Plugin 'easymotion/vim-easymotion'

" LaTeX editing
"Plugin 'LaTeX-Box-Team/LaTeX-Box'

" Status bar mods
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'airblade/vim-gitgutter'

" Color schemes
Plugin 'jnurmine/Zenburn'
Plugin 'altercation/vim-colors-solarized'

" Tab completion
"Plugin 'ervandew/supertab'

" Google auto-format tools
Plugin 'google/vim-maktaba'
Plugin 'google/vim-codefmt'
Plugin 'google/vim-glaive'

" After all plugins...
call vundle#end()
call glaive#Install()
filetype plugin indent on" Fix cursor issues


""""""" Other configuration """""""
set guicursor:
let $NVIM_TUI_ENABLE_CURSOR_SHAPE = 0

" Python support
" let g:loaded_python_provider=1
let g:python_host_prog = '/usr/bin/python'

" Real programmers do not use TABS but spaces
set tabstop=4
set softtabstop=4
set shiftwidth=4
set shiftround
set expandtab
set textwidth=79
set autoindent

" Set default file format to unix
set fileformat=unix

" File encoding
set encoding=utf-8

" Display line numbers on the left margin
set number

" Display tabs with > and spaces with -
set list

" Enable code folding
set foldmethod=indent
set foldlevel=99

" Update time for vim-gitgutter
set updatetime=100

"""""" Auto formatting """"""
augroup autoformat_settings
  autocmd FileType bzl AutoFormatBuffer buildifier
  autocmd FileType c,cpp,proto,javascript AutoFormatBuffer clang-format
  autocmd FileType dart AutoFormatBuffer dartfmt
  autocmd FileType go AutoFormatBuffer gofmt
  autocmd FileType gn AutoFormatBuffer gn
  autocmd FileType html,css,sass,scss,less,json AutoFormatBuffer js-beautify
  autocmd FileType java AutoFormatBuffer google-java-format
  autocmd FileType python AutoFormatBuffer yapf
  " Alternative: autocmd FileType python AutoFormatBuffer autopep8
augroup END

"""""" Key remaps """"""
" Code folding
nnoremap <space> za

" Add Clang-format to nvim
"map <C-K> :pyf /usr/share/vim/addons/syntax/clang-format.py<cr>
"imap <C-K> <c-o>:pyf /usr/share/vim/addons/syntax/clang-format.py<cr>

" Ycm autocomplete customizations
let g:ycm_autoclose_preview_window_after_completion=1
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>

" NERDTree configurations
let NERDTreeIgnore=['\.pyc$', '\~$'] "Ignore files in NERDTree
map <C-n> :NERDTreeToggle<CR>

" Color scheme configuration
"if has('gui_running')
"  set background=dark
"  colorscheme solarized
"else
"  colorscheme solarized
"endif
"call togglebg#map("<F5>")
colorscheme slate

" Syntax highlighting
let python_highlight_all=1
syntax on

" Easytags configuration
set tags=~/.nvimtags
" Sensible defaults
let g:easytags_events = ['BufReadPost', 'BufWritePost']
let g:easytags_async = 1
let g:easytags_dynamic_files = 2
let g:easytags_resolve_links = 1
let g:easytags_suppress_ctags_warning = 1

" Tagbar settings -----
" Open/close tagbar with \b
nmap <silent> <leader>b :TagbarToggle<CR>
" Uncomment to open tagbar automatically whenever possible
"autocmd BufEnter * nested :call tagbar#autoopen(0)

" Airline configuration
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
"let g:airline#extensions#tabline#left_sep = ' '
"let g:airline#extensions#tabline#left_alt_sep = '|'
