"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" _Vimrc Configuration File
" Last Change:  2019 Mar 18
" Maintainer:   Jonny Wilson <jonnylwilson@gmail.com>
" License:      This file is placed in the public domain.
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Package Manager:VimPlug --------------------------------------------------- {{{
call plug#begin()
"ctrlp plugin
Plug 'ctrlpvim/ctrlp.vim'
"vimtex plugin
Plug 'lervag/vimtex'
"nerdtree plugin
Plug 'scrooloose/nerdtree'
"colorscheme plugin
Plug 'https://github.com/xolox/vim-misc'
Plug 'https://github.com/xolox/vim-colorscheme-switcher'
"lightline statusbar plugin
Plug 'itchyny/lightline.vim'
"download dracula theme
Plug 'dracula/vim', { 'as': 'dracula' }
call plug#end()
"ctrlp settings
let g:ctrlp_clear_cache_on_exit = 0
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
set columns=80           "set default number of columns
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
set list
set listchars=tab:>-,trail:·,extends:>,eol:¬,space:·
set spell spelllang=en_us
let g:solarized_visibility="low"  "to make listchars display better
silent! colorscheme dracula       "set the color scheme
set guioptions=           "disable all additional GUI options
set guifont=Consolas      "set the default GUI font
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
nnoremap + :call SetFontSize_inc()<CR> :echo getfontname()<CR>
nnoremap - :call SetFontSize_dec()<CR> :echo getfontname()<CR>
" }}}
" Key Mapping:Leader Key ---------------------------------------------------- {{{
let mapleader=" "        "set leader key to <Space>
"source vimrc file 
nnoremap <leader>sv :source $MYVIMRC<CR>
"delete trailing whitespaces
nnoremap <leader>dw :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar><CR>
"enable/disable spelling
nnoremap <leader>sp :set spell!<CR>
"enable/disable highlighting of over length lines
nnoremap <leader>f :call OverLengthToggle()<CR>
"change the color scheme
nnoremap <leader>ev :tab new $MYVIMRC<CR>
"toggle white spaces
nnoremap <leader>ew :set list!<CR>
" }}}
" Function:Toggle Over length ----------------------------------------------- {{{
"set over length highlighting
function! DefaultOverLength()
  highlight OverLength ctermbg=red ctermfg=white guibg=#592929
  match OverLength /\%>81v.\+/
endfunction
" 
call DefaultOverLength()
let g:overlength_toggle_enabled=0
function! OverLengthToggle()
match OverLength /\%>81v.\+/
  if g:overlength_toggle_enabled
    call DefaultOverLength()
    let g:overlength_toggle_enabled=0
    echo 'overlength enabled'
  else
    highlight OverLength NONE
    let g:overlength_toggle_enabled=1
    echo 'overlength disabled'
  endif
endfunction
" }}}
" Function:Change Font Size-------------------------------------------------- {{{
"increase font size
let g:fontsize=10
function! SetFontSize_inc()
  let g:fontsize= g:fontsize + 1
  call UpdateFontSize()
endfunction
"
"
"decrease font size
function! SetFontSize_dec()
  let g:fontsize= g:fontsize - 1
call UpdateFontSize()
  endfunction
"
function! UpdateFontSize()
  execute ":set guifont=Consolas:h". g:fontsize
endfunction
"
"
" }}}
