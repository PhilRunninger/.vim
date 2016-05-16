" Re-source this file when saving it
augroup reload_vimrc
  autocmd!
  autocmd BufWritePost $MYVIMRC nested source $MYVIMRC
augroup END

set encoding=utf-8
set fileencoding=utf-8

let $VIMHOME=expand('<sfile>:p:h')

filetype off
call plug#begin($VIMHOME.'/bundle')

  " Git-related
  Plug 'git@github.com:tpope/vim-fugitive'
  Plug 'git@github.com:airblade/vim-gitgutter'

  " NerdTree
  Plug 'git@github.com:scrooloose/nerdtree'
  Plug 'git@github.com:Xuyuanp/nerdtree-git-plugin'
  Plug 'git@github.com:PhilRunninger/nerdtree-bwipeout-plugin'

  " Syntax highlighting and color
  Plug 'git@github.com:guns/xterm-color-table.vim'
  Plug 'git@github.com:flazz/vim-colorschemes'
  Plug 'git@github.com:vim-scripts/ScrollColors'
  Plug 'git@github.com:aklt/plantuml-syntax'
  Plug 'git@github.com:tpope/vim-markdown'
  Plug 'git@github.com:elzr/vim-json'
  Plug 'git@github.com:vim-scripts/NSIS-syntax-highlighting'

  " Coding / Development
  Plug 'git@github.com:benekastah/neomake'
  Plug 'git@github.com:majutsushi/tagbar'
  Plug 'git@github.com:tpope/vim-commentary.git'
  Plug 'git@github.com:Shougo/neosnippet'
  Plug 'git@github.com:PhilRunninger/vim-snippets'
  Plug 'git@github.com:tpope/vim-dispatch'

  " Miscellaneous Utilities
  Plug 'git@github.com:jlanzarotta/bufexplorer.git'
  Plug 'git@github.com:Shougo/neocomplcache.vim'
  Plug 'git@github.com:chrisbra/Recover.vim'
  Plug 'git@github.com:kshenoy/vim-signature'
  Plug 'git@github.com:mbbill/undotree'
  Plug 'git@github.com:junegunn/vim-easy-align'
  Plug 'git@github.com:mtth/scratch.vim'
  Plug 'git@github.com:tpope/vim-repeat'
  Plug 'git@github.com:tpope/vim-surround'
  Plug 'git@github.com:tpope/vim-unimpaired'

  " Filetype-specific
  Plug 'git@github.com:chrisbra/csv.vim'
  Plug 'git@github.com:tpope/vim-jdaddy'

  "Fun Stuff
  Plug 'git@github.com:uguu-org/vim-matrix-screensaver'

call plug#end()
filetype plugin indent on

let g:netrw_dirhistmax = 0 " Prevent creation of .netrwhist files.

let mapleader=" "

syntax on           " Turn syntax highlighting on.

set history=1000    " number of command-lines that are remembered.
set showcmd         " show (partial) command in last line of screen
set noshowmode      " [no] message on status line show current mode
set wildmenu        " use menu for command line completion
set wildmode=full   " mode for 'wildchar' command-line expansion
set wildignorecase  " specifies how command line completion is done
                    " files matching these patterns are not completed
set wildignore+=*.a,*.o,*.beam
set wildignore+=*.bmp,*.gif,*.jpg,*.ico,*.png
set wildignore+=.DS_Store,.git,.ht,.svn
set wildignore+=*~,*.swp,*.tmp

" Searching settings
set hlsearch        " highlight matches with last search pattern
set incsearch       " highlight match wile typing search pattern
set ignorecase      " ignore case in search patterns
set smartcase       " no ignore case when pattern has uppercase

" Function to toggle visual selection between: lowercase, Title Case, and UPPERCASE.
function! TwiddleCase(str)
  if a:str ==# toupper(a:str)
    let result = tolower(a:str)
  elseif a:str ==# tolower(a:str)
    let result = substitute(a:str,'\(\<\w\+\>\)', '\u\1', 'g')
  else
    let result = toupper(a:str)
  endif
  return result
endfunction
vnoremap <silent> ~ y:call setreg('', TwiddleCase(@"), getregtype(''))<CR>gv""Pgv

" Tab settings and behavior
set autoindent      " take indent for new line from previous line
set smartindent     " smart autoindenting for c programs
set softtabstop=2   " number of spaces that <tab> uses when editing
set tabstop=2       " number of spaces that <tab> in file uses
set shiftwidth=2    " number of spaces to use for (auto)indent step
set expandtab       " use spaces when <tab> is inserted

set number          " print the line number in front of each line
nnoremap <C-N> :set relativenumber!<CR>

set scrolloff=3     " minimum # of lines above and below cursor
set showmatch       " briefly jump to matching bracket if inserting one
set list            " show <tab> and <eol>
set confirm         " ask what to do with unsave/read-only files
set guioptions=     " gui: which components and options are used
if has("win32")
  set guifont=Consolas:h12:w6
endif
set listchars=tab:¬-,extends:»,precedes:«,trail:¤   " characters for displaying in list mode
set fillchars=stl:\ ,stlnc:\ ,vert:\      " characters to use for displaying special items
set tags=./tags;/                         " list of filenames used by the tag command

set backspace=indent,eol,start            " how backspace works at start of line
set whichwrap+=<,>,[,]                    " allow specified keys to cross line boundaries

set hidden                                " don't unload buffer when it is abandoned
set showtabline=0                         " tells when the tab pages line is displayed

set undolevels=100                        " maximum number of changes that can be undone
set undofile                              " automatically save undo history to an undo file
set undodir=$VIMHOME/tmp/undo//           " list of directory names for undo files
set directory=$VIMHOME/tmp/swapfiles//    " list of directory names for swap files
set nobackup                              " [do not] keep backup file after overwriting a file
set backupdir=$VIMHOME/tmp/backups//      " list of directory namde for the backup file
set laststatus=2                          " tells when last window has status line


" Disable the bells (audible and visual).
set noerrorbells    " [do not] ring the bells for error messages
set visualbell      " use visual bell instead of beeping
set t_vb=
autocmd GUIEnter * set visualbell t_vb=

" Window behavior and commands
set splitbelow                            " new window from split is below the current one
set splitright                            " new window is put right of the current one
set winminheight=0                        " minimum number of lines for any window
set winminwidth=0                         " minimum number of columns for any window
nnoremap <silent> <Tab> :wincmd w<CR>
nnoremap <silent> <C-K> :wincmd k<CR>
nnoremap <silent> <C-J> :wincmd j<CR>
nnoremap <silent> <C-H> :wincmd h<CR>
nnoremap <silent> <C-L> :wincmd l<CR>
nnoremap <silent> <S-Up>  :resize +5<CR>
nnoremap <silent> <S-Down> :resize -5<CR>
nnoremap <silent> <S-Right>  :vertical resize +10<CR>
nnoremap <silent> <S-Left> :vertical resize -10<CR>

set autoread        " automatically read file when changed outside of vim
augroup checktime   " terminal mode hack for autoread option
  au!
  if !has("gui_running")
    "silent! necessary; otherwise, throws errors when using command line window.
    autocmd BufEnter        * silent! checktime
    autocmd CursorHold      * silent! checktime
    autocmd CursorHoldI     * silent! checktime
    "these two _may_ slow things down. Remove if they do.
    autocmd CursorMoved     * silent! checktime
    autocmd CursorMovedI    * silent! checktime
  endif
augroup END

runtime macros/matchit.vim
nnoremap <silent> n   nzzzv
nnoremap <silent> N   Nzzzv

nnoremap j gj
nnoremap k gk

" When editing a file, always jump to its last known cursor position.
autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif

" Show/hide cursorline and cursorcolumn
nnoremap <silent> + :set cursorline! cursorcolumn!<CR>
nnoremap <silent> - :set cursorline!<CR>
nnoremap <silent> \| :set cursorcolumn!<CR>

" mapping to change cwd to current buffer's directory
nnoremap <leader>cd :cd %:p:h<CR>:pwd<CR>

" Remove trailing spaces
nnoremap <leader>d<space> :%s/\s\+$//c<CR>

" Convert Erlang "list strings" to <<"binary strings">>, and back again.
nnoremap <> m`f"a>><ESC>,,i<<<ESC>``ll
nnoremap >< m`f"lxx,,XX``hh

" Disable q: key sequence
nnoremap q: <nop>
nnoremap Q <nop>

" HARD MODE: Disable the arrow and Pg Up/Down keys
nnoremap <Left> <Nop>
nnoremap <Right> <Nop>
nnoremap <Up> <Nop>
nnoremap <Down> <Nop>
nnoremap <PageUp> <Nop>
nnoremap <PageDown> <Nop>

inoremap <Left> <Nop>
inoremap <Right> <Nop>
inoremap <Up> <Nop>
inoremap <Down> <Nop>
inoremap <PageUp> <Nop>
inoremap <PageDown> <Nop>

vnoremap <Left> <Nop>
vnoremap <Right> <Nop>
vnoremap <Up> <Nop>
vnoremap <Down> <Nop>
vnoremap <PageUp> <Nop>
vnoremap <PageDown> <Nop>

" Exit insert mode without Escape
inoremap jk <esc>

" Grab PivotalTracker ID and start commit message.
autocmd BufReadPost COMMIT_EDITMSG execute "silent! normal! qzq/# On branch.\\{-}\\zs\\d\\{8,}\<CR>\"zy//e\<CR>gg\"zPI[#\<ESC>A] \<ESC>:1,1s/\\[#\\] //\<CR>"

" Set filetype of VHT Log files
autocmd BufRead,BufNewFile MainOutputLog*.txt setfiletype vht
autocmd BufReadPost MainOutputLog*.txt set filetype=vht
autocmd BufReadPost IVROutputLog*.txt set filetype=vht

" Shortcut for swapping between current and previous buffers
nnoremap <silent> # :b#<CR>

"##########################################################################
"# Settings for managed plugins                                           #
"##########################################################################

" BufExplorer
nnoremap <silent><expr> <leader>b winnr()==g:NERDTree.GetWinNum() ? ":NERDTreeClose\<CR>:ToggleBufExplorer\<CR>" : ":ToggleBufExplorer\<CR>"
let g:bufExplorerDisableDefaultKeyMapping=1
let g:bufExplorerShowNoName=1
let g:bufExplorerDefaultHelp=0
let g:bufExplorerDetailedHelp=0

" EasyAlign
vmap <Enter> <Plug>(EasyAlign)

" Fugitive
nnoremap <silent> <F3> "zyiw/<C-R>z<CR>:Ggrep -e '<C-R>z'<CR><CR>:copen<CR>:redraw!<CR>
vnoremap <silent> <F3> "zy/<C-R>z<CR>:Ggrep -e '<C-R>z'<CR><CR>:copen<CR>:redraw!<CR>

" NeoComplCache / NeoSnippet
set completeopt=longest,menuone

let g:neocomplcache_enable_fuzzy_completion = 1
let g:neocomplcache_enable_at_startup = 1
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<S-TAB>"

let g:neosnippet#disable_runtime_snippets = { '_' : 1  }
let g:neosnippet#enable_snipmate_compatibility = 1
let g:neosnippet#snippets_directory=$VIMHOME . '/bundle/vim-snippets/snippets'
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" NeoMake
autocmd! BufWritePost * Neomake

" Nerdtree
nnoremap <silent><expr> <leader>n bufname(winbufnr(0))=='[BufExplorer]' ? ":ToggleBufExplorer\<CR>:NERDTreeFocus\<CR>" : (winnr()==g:NERDTree.GetWinNum() ? ":NERDTreeClose\<CR>" : ":NERDTreeFocus\<CR>")
nnoremap <silent><expr> <leader>f bufname(winbufnr(0))=='[BufExplorer]' ? ":ToggleBufExplorer\<CR>:NERDTreeFind\<CR>" : ":NERDTreeFind\<CR>"
let NERDTreeAutoCenter=1
let NERDTreeAutoCenterThreshold=5
let NERDTreeChDirMode=2
let NERDTreeMinimalUI=1
let NERDTreeSortHiddenFirst=1
let NERDTreeShowBookmarks=1
let NERDTreeWinSize=42
let NERDTreeQuitOnOpen=1
let NERDTreeIgnore=['^ntuser\.', '^NTUSER\.', '^deps$', '^ebin$']

" Scratch
let g:scratch_insert_autohide = 0

" Tagbar
nnoremap <silent><expr> <leader>t bufname(winbufnr(0))=~'^__Tagbar__$' ? ":TagbarClose\<CR>" : ":TagbarOpen fj\<CR>"
let g:tagbar_sort = 0
let g:tagbar_show_linenumbers = -1
augroup tagbar_autoopen
  autocmd!
  autocmd VimEnter * nested :call tagbar#autoopen(1)
augroup END

" Undotree
nnoremap <silent> <leader>u :UndotreeToggle<CR>
let g:undotree_SetFocusWhenToggle = 1
let g:undotree_WindowLayout = 2

" vim-snippets
let g:snips_author = "Phil Runninger"
let g:snips_email = "prunninger@virtualhold.com"
let g:snips_github = "https://github.com/PhilRunninger"

"##########################################################################
"# Color Settings                                                         #
"##########################################################################
let g:gruvbox_contrast_dark = 'hard'
colorscheme gruvbox
set background=dark

let g:statusline_insert='cterm=none ctermfg=15 ctermbg=19 guifg=#000000 guibg=#dfaf00'     " white on Blue
let g:statusline_modified='cterm=none ctermfg=15 ctermbg=52 guifg=#000000 guibg=#5f0000'   " White on Dark Red
let g:statusline_unmodified='cterm=none ctermfg=15 ctermbg=22 guifg=#000000 guibg=#005f00' " White on Dark Green

highlight WildMenu cterm=none ctermfg=16 ctermbg=178  guifg=#000000 guibg=#dfaf00  " Black on Gold
highlight User1    cterm=none ctermbg=22 ctermfg=40   guibg=#005f00 guifg=#00df00  " Green on Dark Green
highlight User2    cterm=none ctermbg=52 ctermfg=160  guibg=#5f0000 guifg=#df0000  " Red on Dark Red
highlight User3    cterm=none ctermbg=17  ctermfg=12  guibg=#00005f guifg=#0000ff  " Blue on Dark Blue
highlight User4    cterm=none ctermbg=234 ctermfg=234 guibg=#1d2021 guifg=#1d2021  " Normal on Normal

function! StatuslineColor(mode)
  if a:mode == 'i'
    exec 'highlight StatusLine '.g:statusline_insert
  elseif &modified
    exec 'highlight StatusLine '.g:statusline_modified
  else
    exec 'highlight StatusLine '.g:statusline_unmodified
  endif
endfunction

augroup set_statusline_colors
  autocmd!
  autocmd InsertEnter,InsertChange,TextChangedI * call StatuslineColor('i')
  autocmd InsertLeave,TextChanged,BufWritePost,BufEnter * call StatuslineColor('n')
augroup END

set statusline=%3p%%\ %4v\ %4*\|
set statusline+=%*%3*%(\ %{fugitive#head(8)}\ %)%*%4*\|
set statusline+=%*%2*%(%{&modified?\"\ modified\ \":\"\"}%)%*%4*\|
set statusline+=%*%1*%(%{&modifiable?&readonly?\"\ ro\ \":\"\":\"\ RO\ \"}%)%*%4*\|
set statusline+=%*\ %{&ft}\ %4*\|
set statusline+=%*\ %{&ff}\ %4*\|
set statusline+=%*\ #%n\ %f

call StatuslineColor('n')

"##########################################################################
" Post processing setup for custom machine-specific overrides.
"##########################################################################
let s:path = fnamemodify(resolve(expand('<sfile>:p')), ':h') . '/post_vimrc'
if filereadable(s:path)
  execute 'source' s:path
endif
