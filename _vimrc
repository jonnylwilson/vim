"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" _Vimrc Configuration File
" Last Change:  2019 May 09
" Maintainer:   Jonny Wilson <jonnylwilson@gmail.com>
" License:      This file is placed in the public domain.
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Package Manager:VimPlug --------------------------------------------------- {{{
call plug#begin()
Plug 'lervag/vimtex' "vimtex plugin
Plug 'scrooloose/nerdtree' "nerdtree plugin
Plug 'itchyny/lightline.vim' "lightline statusbar plugin
Plug 'https://github.com/rakr/vim-one' "download vim-one colorsheme
call plug#end()
"
"set lightline colorscheme
let g:lightline = {
      \ 'colorscheme': 'one',
      \ }
"
"set default viewer for vimtex
let g:vimtex_view_general_viewer = 'SumatraPDF'
let g:vimtex_compiler_latexmk_engines = {'_':'-lualatex'}
"
" }}}
" Settings: Basic ------------------------------------------------------------{{{
syntax on                 "enable syntax highlighting
set encoding=utf-8        "set default encoding
set shell=powershell      "set default shell
set laststatus=2          "enable the status bar
set showcmd               "show command in the last line of the screen
set number                "show line number
set relativenumber        "show line number relative to the line with cursor
set ruler                 "show line and column number of cursor position
set textwidth=80          "set text width
set colorcolumn=+1        "set highlighting screen column
"set columns=81           "set default number of columns
set scrolloff=50          "minimum number of lines to keep above & below cursor
set nowrap                "disable text wrapping
set hlsearch              "highlight all search results
set incsearch             "highlight search while typing
set showmatch             "show matching brackets
set backspace=2           "backspace deletes like most programs in insert mode
set clipboard=unnamed     "use the systems clipboard as default
set splitright            "set splits to right
set splitbelow            "set splits below
set foldmethod=marker     "set fold method
set nrformats-=octal,hex  "number increment settings
set tabstop=2             "number of spaces that a <Tab> in the file counts for
set expandtab             "use tabs instead of spaces
set autoindent            "enable auto indent
set shiftwidth=2          "number of spaces for auto indent
set listchars=tab:>-,trail:·,extends:>,eol:¬,space:·
set spell spelllang=en_us
set spell!
silent! colorscheme one       "set the color scheme
set guioptions=           "disable all additional GUI options
set guifont=PragmataPro_Mono_Liga:h10:cANSI:qDRAFT
set mouse=a               "mouse clicks do not move cursor
set mousehide             "hide mouse when typing
" }}}
" Key Mapping:Basic --------------------------------------------------------- {{{
"set jk to <ESC>
inoremap jk <ESC>
"set <C-l> to clear search highlighting
nnoremap <silent> <C-l> :nohlsearch<CR><C-l>
"set <C-o> to toggle NERDtree
nnoremap <silent> <C-o> :NERDTreeToggle<CR>
" }}}
" Key Mapping:Leader Key ---------------------------------------------------- {{{
let mapleader=" "        "set leader key to <Space>
"source vimrc file
nnoremap <leader>sv :source $MYVIMRC<CR>
"enable/disable spelling
nnoremap <leader>sp :set spell!<CR>
"change the color scheme
nnoremap <leader>ev :tab new $MYVIMRC<CR>
"toggle white spaces
nnoremap <leader>ew :set list!<CR>
" }}}
