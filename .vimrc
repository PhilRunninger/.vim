"==============================================================================
" To use this file from this location, create the file ~/.vimrc with this line:
"       source ~/.vim/.vimrc
" (You will have to change the path if the file's location changes.)
"==============================================================================
"
" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'git@github.com:PhilRunninger/vim-execute-in-shell.git'
Plugin                 'vim-scripts/NSIS-syntax-highlighting'
Plugin                'jlanzarotta/bufexplorer.git'
Plugin                'scrooloose/nerdtree'
Plugin                 'chrisbra/Recover.vim'
Plugin                'chrisbra/csv.vim'
Plugin               'junegunn/vim-easy-align'
Plugin              'atweiden/vim-dragvisuals'
Plugin              'morhetz/gruvbox'
Plugin              'Shougo/neocomplcache.vim'
Plugin             'mbbill/undotree'
"Plugin            'idbrii/AsyncCommand'
Plugin           'idbrii/vim-mark'
Plugin          'gmarik/Vundle.vim'
Plugin          'tpope/vim-unimpaired'
Plugin         'tpope/vim-surround'
Plugin        'tpope/vim-repeat'
Plugin       'tpope/vim-markdown'
Plugin      'tpope/vim-jdaddy'
Plugin     'tpope/vim-fugitive'
Plugin    'Milly/vim-openurl'
Plugin    'mtth/cursorcross.vim'
Plugin   'elzr/vim-json'
Plugin  'aklt/plantuml-syntax'
call vundle#end()

filetype plugin indent on
filetype on

:let g:netrw_dirhistmax = 0

" Make sure Alt-Space will open the gvim window's control menu.
noremap <M-Space> :simalt ~<CR>

set encoding=utf-8
syntax on

set history=1000
set showcmd
set wildmenu
set wildmode=full

" Searching settings
set hlsearch    " highlight search results
set incsearch   " incremental searching
set ignorecase  " case insensitive search
set smartcase   " ... unless using capital letters

runtime macros/matchit.vim
nnoremap <silent> n   nzzzv
nnoremap <silent> N   Nzzzv

set backspace=indent,eol,start  " backspace and cursor keys wrap to previous/next line
set whichwrap+=<,>,[,]

set autoread

" tab settings and behavior
set autoindent
set smartindent
set softtabstop=4
set tabstop=4
set shiftwidth=4
set expandtab

set scrolloff=3
set showmatch
set number
set list
set fillchars=stl:\ ,stlnc:\ ,vert:\ 
set listchars=tab:†.,extends:»,precedes:«,trail:●
set tags=./tags;/

" Disable the bells (audible and visual).
set noerrorbells visualbell t_vb=
autocmd GUIEnter * set visualbell t_vb=

" Window behavior and commands
nnoremap <silent> <C-Tab> :wincmd w<CR>
nnoremap <silent> <C-K> :wincmd k<CR>
nnoremap <silent> <C-J> :wincmd j<CR>
nnoremap <silent> <C-H> :wincmd h<CR>
nnoremap <silent> <C-L> :wincmd l<CR>
nnoremap <silent> <C-Up>  :resize +5<CR>
nnoremap <silent> <C-Down> :resize -5<CR>
nnoremap <silent> <C-Right>  :vertical resize +10<CR>
nnoremap <silent> <C-Left> :vertical resize -10<CR>
set splitbelow
set splitright
set winminheight=0
set winminwidth=0

set hidden
set showtabline=0

" When editing a file, always jump to its last known cursor position.
autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif

:silent cd $HOME                            " change to my most common working directory
nnoremap <leader>cd :cd %:p:h<CR>:pwd<CR>   " command to change pwd to current buffer's

" Remove trailing spaces
nnoremap <leader>d<space> :%s/\s\+$//c<CR>

" Convert Erlang "list strings" to <<"binary strings">>, and back again.
nnoremap <> m`f"a>><ESC>,,i<<<ESC>``ll
nnoremap >< m`f"lxx,,XX``hh

"##########################################################################
"# Disable bad-habit keys                                                 #
"##########################################################################
nnoremap <Left> <nop>
nnoremap <Right> <nop>
nnoremap <Up> <nop>
nnoremap <Down> <nop>
inoremap <Left> <nop>
inoremap <Right> <nop>
inoremap <Up> <nop>
inoremap <Down> <nop>

"##########################################################################
"# Settings for managed plugins                                           #
"##########################################################################
" Gruvbox (color):  https://github.com/morhetz/gruvbox.git
" BufExplorer:  https://github.com/jlanzarotta/bufexplorer.git
let g:bufExplorerDisableDefaultKeyMapping=1
let g:bufExplorerShowNoName=1
let g:bufExplorerDefaultHelp=0
let g:bufExplorerDetailedHelp=0
nnoremap <silent> <F2> :ToggleBufExplorer<CR>

" Csv:  https://git@github.com:chrisbra/csv.vim.git
" CursorCross:  https://github.com/mtth/cursorcross.vim.git
let g:cursorcross_dynamic = 'w'
nnoremap + :set cursorline! cursorcolumn!<CR>

" DragVisuals:  https://github.com/atweiden/vim-dragvisuals.git
vnoremap  <expr>  <LEFT>   DVB_Drag('left')
vnoremap  <expr>  <RIGHT>  DVB_Drag('right')
vnoremap  <expr>  <DOWN>   DVB_Drag('down')
vnoremap  <expr>  <UP>     DVB_Drag('up')
vnoremap  <expr>  D        DVB_Duplicate()

" EasyAlign:  https://github.com/junegunn/vim-easy-align.git
vnoremap <Enter> <Plug>(EasyAlign)

" ExecuteInShell:  https://github.com/PhilRunninger/vim-execute-in-shell
ca shell Shell
nnoremap <F5> :w<CR>:Shell rebar -r eunit suite=%:t:r skip_deps=true<CR>
nnoremap <F6> :w<CR>:Shell rebar -r eunit skip_deps=true<CR>

" Fugitive:  git@github.com:tpope/vim-fugitive.git
set laststatus=2
set statusline=\ %v\ %3*%{fugitive#statusline()}%*\ %f\ %n
set statusline+=\ %1*%{&modifiable?&readonly?\"\ ro\ \":\"\":\"\ RO\ \"}%*
set statusline+=\ %2*%{&modified?\"\ mod\ \":\"\"}%*
set statusline+=%=%p%%\ 

" JDaddy:  https://github.com/tpope/vim-jdaddy.git
" JSON:  https://github.com/elzr/vim-json.git
" Mark:  https://github.com/idbrii/vim-mark.git
" Markdown:  https://github.com/tpope/vim-markdown.git
" NeoComplCache:  http://github.com/Shougo/neocomplcache.vim.git
let g:neocomplcache_enable_fuzzy_completion = 1
let g:neocomplcache_enable_at_startup = 1
inoremap <expr><TAB>    pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><S-TAB>  pumvisible() ? "\<C-p>" : "\<S-TAB>"

" Nerdtree:  https://github.com/scrooloose/nerdtree.git
nnoremap <silent><F3> :NERDTreeToggle<CR>
let NERDTreeMinimalUI=1
let NERDTreeSortHiddenFirst=1
let NERDTreeShowBookmarks=1
let NERDTreeWinSize=42

" NSIS:  https://github.com/vim-scripts/NSIS-syntax-highlighting.git
" Repeat:  git://github.com/tpope/vim-repeat.git
" Surround:  git://github.com/tpope/vim-surround.git
" Undotree:  https://github.com/mbbill/undotree.git
nnoremap <silent><F4> :UndotreeToggle<CR>
let g:undotree_SetFocusWhenToggle = 1
let g:undotree_TreeNodeShape = '#'
let g:undotree_WindowLayout = 2

" Unimpaired:  https://github.com/tpope/vim-unimpaired.git
" VisualStarSearch:  https://github.com/nelstrom/vim-visual-star-search.git
