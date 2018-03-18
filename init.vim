set termguicolors

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.config/nvim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'ayu-theme/ayu-vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'vim-scripts/indentpython.vim'
Plugin 'nvie/vim-flake8'
Plugin 'Vimjas/vim-python-pep8-indent'
Plugin 'vim-ruby/vim-ruby'
Plugin 'rking/ag.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-unimpaired'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-markdown'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-bundler'
Plugin 'tpope/vim-characterize'
Plugin 'justinmk/vim-sneak'
Plugin 'tomtom/tcomment_vim'
Plugin 'edkolev/tmuxline.vim'
Plugin 'cakebaker/scss-syntax.vim'
Plugin 'hail2u/vim-css3-syntax'
Plugin 'ap/vim-css-color'
Plugin 'pangloss/vim-javascript'
Plugin 'jelera/vim-javascript-syntax'
Plugin 'mxw/vim-jsx'
Plugin 'elzr/vim-json'
Plugin 'othree/html5.vim'
Plugin 'vim-scripts/matchit.zip'
Plugin 'gregsexton/MatchTag'
Plugin 'gregsexton/gitv'
Plugin 'airblade/vim-gitgutter'
Plugin 'qpkorr/vim-bufkill'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'bling/vim-airline'
Plugin 'Shougo/denite.nvim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" Theme
let ayucolor="dark"   " for dark version of theme
colorscheme ayu

" Variable setup
set clipboard=unnamed               " yanks should go to system clipboard too
set hidden                          " keep undo history when changing buffers
set encoding=utf-8                  " enable nice characters
set number                          " display line numbers
set relativenumber                  " relative line numbers
set modeline                        " read mode lines in file for settings
set modelines=5                     " # of modelines at beg/end of file
set expandtab                       " insert spaces when pressing <Tab>
set smarttab                        " insert shiftwidthXspace at line beginning
set shiftround                      " indent is multiple of shiftwidth
set shiftwidth=4                    " insert 4 spaces when pressing <Tab>
set softtabstop=4                   " move by 4 spaces when pressing <Tab>
set tabstop=8                       " show \t as 8 spaces wide (dont be evil!)
set ruler
set textwidth=0                     " for text files (reset by filetype below)
set showmatch                       " show matching parens/braces/brackets
set matchtime=3                     " jump to matching paren for 30ms
set lazyredraw                      " don't repaint screen for untyped input
set smartindent
set visualbell
set showfulltag
set incsearch                       " do incremental searches
set hlsearch                        " highlight all matching searches
set wrapscan                        " searches wrap around end of file
set undolevels=1000                 " explicitly set default
set history=1000                    " :commands/searches to remember
set shellpipe=&>                    " don't echo grep output to screen
set linebreak                       " visual wrap at space/punctuation
set cpoptions+=n
set mousehide                       " hide mouse cursor when typing
set autoread                        " reload unedited files that changed
set display+=lastline               " show long last line in window
set splitbelow                      " new split opens below old one
set splitright                      " ... or to the right of it
set tags=tags,$/.tags
set showcmd                         " display incomplete commands
set backspace=indent,eol,start
set ignorecase                      " ignore case in searches
set smartcase                       " ... unless pattern contains uppercase
set scrolloff=3

syntax on

" bad whitespcae
highlight BadWhitespace ctermbg=red guibg=red
au BufRead,BufNewFile *.rb,*.py,*.js match BadWhitespace /\s\+$/

" Lang-specific settings

" Ruby
au BufNewFile,BufRead *.rb
    \ set tabstop=2 |
    \ set softtabstop=2 |
    \ set shiftwidth=2 |
    \ set textwidth=79 |
    \ set expandtab |
    \ set autoindent

" Python
let python_highlight_all=1
au BufNewFile,BufRead *.py
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set textwidth=79 |
    \ set expandtab |
    \ set autoindent

" JS
au BufNewFile,BufRead *.js, *.html, *.css
    \ set tabstop=2 |
    \ set softtabstop=2 |
    \ set shiftwidth=2 |
    \ set autoindent

" Plugin options

" Ag
let g:ag_prg = "ag --nogroup --column --smart-case --nocolor --hidden"
let g:ag_highlight = 1

" denite
nnoremap <Leader>p              :Denite file_rec<CR>
highlight default link deniteMatchedChar CursorLine
highlight default link deniteMatchedRange None

call denite#custom#map(
    \ 'insert',
    \ '<C-j>',
    \ '<denite:move_to_next_line>',
    \ 'noremap'
    \)
call denite#custom#map(
    \ 'insert',
    \ '<C-k>',
    \ '<denite:move_to_previous_line>',
    \ 'noremap'
    \)

" airline/powerline
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline#extensions#tabline#buffer_idx_mode = 1
nmap <Leader>1                  <Plug>AirlineSelectTab1
nmap <Leader>2                  <Plug>AirlineSelectTab2
nmap <Leader>3                  <Plug>AirlineSelectTab3
nmap <Leader>4                  <Plug>AirlineSelectTab4
nmap <Leader>5                  <Plug>AirlineSelectTab5
nmap <Leader>6                  <Plug>AirlineSelectTab6
nmap <Leader>7                  <Plug>AirlineSelectTab7
nmap <Leader>8                  <Plug>AirlineSelectTab8
nmap <Leader>9                  <Plug>AirlineSelectTab9

" vim sneak
let g:sneak#streak = 1
nmap f                          <Plug>Sneak_f
nmap F                          <Plug>Sneak_F
xmap f                          <Plug>Sneak_f
xmap F                          <Plug>Sneak_F
omap f                          <Plug>Sneak_f
omap F                          <Plug>Sneak_F
nmap t                          <Plug>Sneak_t
nmap T                          <Plug>Sneak_T
xmap t                          <Plug>Sneak_t
xmap T                          <Plug>Sneak_T
omap t                          <Plug>Sneak_t
omap T                          <Plug>Sneak_T

" syntastic settings
set statusline+=%#warningmsg#
set statusline+=%{SyntacticStatuslineFlag()}
set statusline+=%*

let g:syntastic_python_python_exec = '/usr/bin/python3'
let g:syntactic_always_populate_loc_list = 1
let g:syntactic_auto_loc_list = 1
let g:syntactic_check_on_open = 1
let g:syntactic_check_on_wq = 0

" you complete me settings
let g:ycm_python_binary_path = '/usr/bin/python3'
let g:ycm_autoclose_preview_window_after_completion = 1
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>

" NERDtree
map <C-n>                       :NERDTreeToggle<CR>
map <F3>                        :NERDTreeFind<CR>
let NERDTreeShowHidden=1
let NERDTreeShowLineNumbers=1
let NERDTreeIgnore=['\.git','\.hg']

" Key mappings
" NOTE: don't use a " comment on the same line as the map, comments aren't recognized!

" toggle search highlighting
"nnoremap <Leader><BS>           :set hlsearch! hlsearch?<CR>
" delete spaces at end of line in whole file
nnoremap <Leader><Space>        :%s,\s\+$,,<CR>
" toggle invisible chars display
nnoremap <Leader>l              :set list! list?<CR>
" easier way to save file
nnoremap <Leader>w              :w<CR>
" easier help
nnoremap <Leader>h              :execute "help ".expand("<cword>")<CR>
" easier quit window
nnoremap <Leader>q              :q<CR>
" find current word in current file
nnoremap <Leader>f              "fyiw/<C-r>f<CR>
" find current word in all files
nnoremap <Leader>a              :execute "Ag ".expand("<cword>")<CR>
" go to previous/next buffer in buflist
nnoremap <C-h>                  :bprev<CR>
nnoremap <C-l>                  :bnext<CR>
" go to previous/next item in quickfix list
nnoremap <C-k>                  :cprev<CR>zv
nnoremap <C-j>                  :cnext<CR>zv
" go to previous/next tabpage in tabs list
nnoremap <C-Up>                 :tabp<CR>zv
nnoremap <C-Down>               :tabn<CR>zv
" delete/abandon current buffer
nnoremap <C-d>                  :BD<CR>
" edit previously edited buffer
nnoremap <C-e>                  :e#<CR>
" move cursor in insert mode
inoremap <C-h>                  <Left>
inoremap <C-l>                  <Right>
" delete everything entered on current line (starts new undo sequence)
inoremap <C-u>                  <C-g>u<C-u>
" ? not mapped since it is used as help character in many spots
nnoremap :s/                    :s/\v
nnoremap :s,                    :s,\v
" move through wrapped screen lines, not line-wise
nnoremap <silent> j             gj
nnoremap <silent> k             gk
nnoremap <silent> ^             g^
nnoremap <silent> $             g$
" auto center on jumps
nnoremap <silent> n             nzz
nnoremap <silent> N             Nzz
nnoremap <silent> *             *zz
nnoremap <silent> #             #zz
nnoremap <silent> g*            g*zz
nnoremap <silent> g#            g#zz
nnoremap <silent> <C-o>         <C-o>zz
nnoremap <silent> <C-i>         <C-i>zz
" reselect visual after indents
vnoremap <                      <gv
vnoremap >                      >gv
" vertical split all buffers
nnoremap <Leader>vsa            :vert sba<CR>
" window splits
nnoremap <Leader>v              <C-w>v<C-w>h
nnoremap <Leader>s              <C-w>s<C-w>k
" easy window navigation
nnoremap <Left>                 <C-w>h
nnoremap <Right>                <C-w>l
nnoremap <Up>                   <C-w>k
nnoremap <Down>                 <C-w>j
" Y consistent with C and D
nnoremap Y                      y$
" folds
nnoremap zr                     zr:echo &foldlevel<CR>
nnoremap zm                     zm:echo &foldlevel<CR>
nnoremap zR                     zR:echo &foldlevel<CR>
nnoremap zM                     zM:echo &foldlevel<CR>

" Git mappings

nnoremap <Leader>g              :Git 
nnoremap <Leader>gd             :Git d<CR>
nnoremap <Leader>gdc            :Git dc <CR>
" this is like running difftool with vimdiff
nnoremap <Leader>gdt            :Gdiff<CR>
nnoremap <Leader>ga             :Git a "%"<CR>
nnoremap <Leader>gl             :Git l <CR>
nnoremap <Leader>gs             :Gstatus<CR>
nnoremap <Leader>gci            :Gcommit <CR>
nnoremap <Leader>gv             :Gitv<CR>
nnoremap <Leader>gV             :Gitv!<CR>
nmap <Leader>gw                 <ESC>:call GitWhoDunnit()<CR>
