" vim: foldmethod=marker

" Plugin Management  {{{1
filetype off
let $VIMHOME=expand('<sfile>:p:h')
silent! call plug#begin($VIMHOME.'/bundle')

  " Coding / Development
  Plug 'git@github.com:tpope/vim-fugitive'
  if v:version > 703
    Plug 'git@github.com:airblade/vim-gitgutter'
  endif
  Plug 'git@github.com:benekastah/neomake'
  Plug 'git@github.com:tpope/vim-commentary.git'
  Plug 'git@github.com:Shougo/neosnippet'
  Plug 'git@github.com:PhilRunninger/vim-snippets'
  Plug 'git@github.com:tpope/vim-dispatch', { 'on': 'Dispatch' }

  " File Management
  Plug 'git@github.com:scrooloose/nerdtree.git'
  Plug 'git@github.com:Xuyuanp/nerdtree-git-plugin'
  Plug 'git@github.com:vifm/vifm.vim.git', { 'on': 'EditVifm' }
  Plug 'git@github.com:PhilRunninger/bufselect.vim.git'

  " Colorschemes
  Plug 'git@github.com:guns/xterm-color-table.vim', { 'on': 'XtermColorTable' }
  Plug 'git@github.com:flazz/vim-colorschemes'
  Plug 'git@github.com:vim-scripts/ScrollColors', { 'on': 'SCROLLCOLOR' }

  " Miscellaneous Utilities
  Plug 'git@github.com:sotte/presenting.vim.git'
  Plug 'git@github.com:Shougo/neocomplcache.vim'
  Plug 'git@github.com:kshenoy/vim-signature'
  Plug 'git@github.com:mbbill/undotree', { 'on': 'UndotreeToggle' }
  Plug 'git@github.com:junegunn/vim-easy-align'
  Plug 'git@github.com:mtth/scratch.vim'
  Plug 'git@github.com:tpope/vim-repeat'
  Plug 'git@github.com:tpope/vim-surround'
  Plug 'git@github.com:tpope/vim-unimpaired'
  Plug 'git@github.com:scrooloose/vim-slumlord'
  Plug 'git@github.com:aklt/plantuml-syntax'

  " Filetype-specific
  Plug 'git@github.com:tpope/vim-markdown', { 'for': 'markdown' }
  Plug 'git@github.com:elzr/vim-json', { 'for': 'json' }
  Plug 'git@github.com:vim-scripts/NSIS-syntax-highlighting', { 'for': ['nsi', 'nsh'] }
  Plug 'git@github.com:chrisbra/csv.vim', { 'for': 'csv' }
  Plug 'git@github.com:tpope/vim-jdaddy', { 'for': 'json' }

call plug#end()
filetype plugin indent on
" }}}1
" Miscellaneous settings   {{{1
set encoding=utf-8                  " Sets the character encoding to use inside vim.
set scrolloff=3                     " Minimum # of lines above and below cursor
set confirm                         " Ask what to do with unsave/read-only files
set tags=./tags;/                   " List of filenames used by the tag command
set backspace=indent,eol,start      " How backspace works at start of line
set whichwrap+=<,>,[,]              " Allow specified keys to cross line boundaries
set ttimeoutlen=10                  " Time out time for key codes in milliseconds (Removes delay after <Esc> in Command mode.)
let g:netrw_dirhistmax = 0          " Prevent creation of .netrwhist files.
let mapleader=" "                   " Character to use for <leader> mappings
syntax on                           " Turn syntax highlighting on.

" Command line options   {{{1
set history=1000                    " number of command-lines that are remembered.
set wildmenu                        " use menu for command line completion
set wildmode=full                   " mode for 'wildchar' command-line expansion
if v:version > 703
  set wildignorecase                " specifies how command line completion is done
endif
set wildignore+=*.a,*.o,*.beam      " files matching these patterns are not completed
set wildignore+=*.bmp,*.gif,*.jpg,*.ico,*.png
set wildignore+=.DS_Store,.git,.ht,.svn
set wildignore+=*~,*.swp,*.tmp

" Function to toggle visual selection between: lowercase, Title Case, and UPPERCASE.   {{{1
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

" Tab settings and behavior   {{{1
set autoindent      " take indent for new line from previous line
set smartindent     " smart autoindenting for c programs
set softtabstop=4   " number of spaces that <tab> uses when editing
set tabstop=4       " number of spaces that <tab> in file uses
set shiftwidth=4    " number of spaces to use for (auto)indent step
set expandtab       " use spaces when <tab> is inserted

" Which things are displayed on screen?   {{{1
set showcmd         " show (partial) command in last line of screen
set noshowmode      " [no] message on status line show current mode
set showmatch       " briefly jump to matching bracket if inserting one
set guioptions=     " gui: which components and options are used
set number          " print the line number in front of each line
set list                                            " show <tab> and <eol>
set listchars=tab:¬-,extends:»,precedes:«,trail:¤   " characters for displaying in list mode
set fillchars=stl:\ ,stlnc:\ ,vert:\                " characters to use for displaying special items
set showtabline=0                                   " tells when the tab pages line is displayed

" Undo/Backup/Swap file settings   {{{1
set undolevels=100                        " maximum number of changes that can be undone
set undofile                              " automatically save undo history to an undo file
set undodir=$VIMHOME/tmp/undo//           " list of directory names for undo files
set directory=$VIMHOME/tmp/swapfiles//    " list of directory names for swap files
set nobackup                              " [do not] keep backup file after overwriting a file
set backupdir=$VIMHOME/tmp/backups//      " list of directory namde for the backup file
set laststatus=2                          " tells when last window has status line

" Disable the bells (audible and visual).   {{{1
set noerrorbells    " [do not] ring the bells for error messages
set visualbell      " use visual bell instead of beeping
set t_vb=
autocmd GUIEnter * set visualbell t_vb=

" Window behavior and commands   {{{1
set splitbelow      " new window from split is below the current one
set splitright      " new window is put right of the current one
set winminheight=0  " minimum number of lines for any window
set winminwidth=0   " minimum number of columns for any window

nnoremap <silent> <Tab> <C-W>w
nnoremap <silent> <S-Tab> <C-W>W

nnoremap <silent> <S-Up>    :resize +5<CR>
nnoremap <silent> <S-Down>  :resize -5<CR>
nnoremap <silent> <S-Right> :vertical resize +10<CR>
nnoremap <silent> <S-Left>  :vertical resize -11<CR>

" Searching settings   {{{1
set hlsearch        " highlight matches with last search pattern
set incsearch       " highlight match wile typing search pattern
set ignorecase      " ignore case in search patterns
set smartcase       " no ignore case when pattern has uppercase
nnoremap <silent> <leader><Space> :nohlsearch<CR>
runtime macros/matchit.vim
nnoremap <silent> n   nzzzv
nnoremap <silent> N   Nzzzv
vnoremap <silent> * :<C-U>
  \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
  \gvy/<C-R><C-R>=substitute(
  \escape(@", '/\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
  \gV:call setreg('"', old_reg, old_regtype)<CR>
nnoremap <silent> <leader>/ :vimgrep "<C-R>/" %<CR>:copen<CR>
vnoremap <silent> <leader>/ y:vimgrep "<C-R>0" %<CR>gv:copen<CR>

" Swap j/k and gj/gk   {{{1
nnoremap j gj
nnoremap k gk
nnoremap gj j
nnoremap gk k

" Show/hide cursorline and cursorcolumn   {{{1
nnoremap <silent> + :set cursorline! cursorcolumn!<CR>
nnoremap <silent> - :set cursorline!<CR>
nnoremap <silent> \| :set cursorcolumn!<CR>

" Change cwd to current buffer's directory   {{{1
nnoremap <leader>cd :cd %:p:h<CR>:pwd<CR>

" Remove trailing spaces   {{{1
nnoremap <leader>d<space> :%s/\s\+$//c<CR>

" Show what highlighting is used under the cursor {{{1
map <F10> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<' . synIDattr(synID(line("."),col("."),0),"name") . "> lo<" . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>

" HARD MODE: Disable the arrow and Pg Up/Down keys {{{1
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

" Auto-command Definitions   {{{1
augroup reload_vimrc " Re-source this file when saving it   {{{2
  autocmd!
  autocmd BufWritePost $MYVIMRC nested source $MYVIMRC
augroup END

augroup checktime   " terminal mode hack for autoread option   {{{2
  autocmd!
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
set autoread        " automatically read file when changed outside of vim

augroup jumpToPreviousLocation " When editing a file, always jump to its last known cursor position.
    autocmd!
    autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
augroup END

augroup pivotalTrackerIDToCommitMesage " Grab PivotalTracker ID and start commit message.  {{{2
    autocmd!
    autocmd BufReadPost COMMIT_EDITMSG execute "silent! normal! qzq/# On branch.\\{-}\\zs\\d\\{8,}\<CR>\"zy//e\<CR>gg\"zPI[#\<ESC>A] \<ESC>:1,1s/\\[#\\] //\<CR>"
augroup END

augroup vhtFileTypes " Set filetype of VHT Log files   {{{2
    autocmd!
    autocmd BufReadPost TIALOutputLog*.txt set filetype=vht
    autocmd BufReadPost MainOutputLog*.txt set filetype=vht
    autocmd BufReadPost IVROutputLog*.txt set filetype=vht
    autocmd BufReadPost debug.log set filetype=vht
    autocmd BufReadPost error.log set filetype=vht
    autocmd BufReadPost *.{[0123456789]}\\\{1,99\} set filetype=vht
augroup END

" Buffer-related settings and mappings   {{{1
set hidden          " don't unload buffer when it is abandoned
nnoremap <silent> <leader>b :ShowBufferList<CR>
nnoremap <silent> # :buffer #<CR>
nnoremap <silent> <leader>n :bnext<CR>
nnoremap <silent> <leader>p :bprevious<CR>

set nostartofline   " commands (don't) move cursor to first non-blank in line
augroup bufferEvents
    autocmd!
    " Remember and set the position of text in buffer when switching
    autocmd BufLeave * let b:winview = winsaveview()
    autocmd BufEnter * if(exists('b:winview')) | call winrestview(b:winview) | endif
augroup END

" Settings for managed plugins   {{{1

" Presenting   {{{2
let g:presenting_top_margin = 2

" EasyAlign   {{{2
vmap <Enter> <Plug>(EasyAlign)

" Fugitive   {{{2
nnoremap <silent> <F3> "zyiw/<C-R>z<CR>:Ggrep -e '<C-R>z'<CR><CR>:copen<CR>:redraw!<CR>
vnoremap <silent> <F3> "zy/<C-R>z<CR>:Ggrep -e '<C-R>z'<CR><CR>:copen<CR>:redraw!<CR>

" NeoComplCache / NeoSnippet   {{{2
set completeopt=longest,menuone

let g:neocomplcache_enable_fuzzy_completion = 1
let g:neocomplcache_enable_at_startup = 1
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<S-TAB>"

let g:neosnippet#disable_runtime_snippets = { '_' : 1  }
let g:neosnippet#enable_snipmate_compatibility = 1
let g:neosnippet#snippets_directory=$VIMHOME.'/bundle/vim-snippets/snippets'
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" NeoMake   {{{2
augroup runNeoMakeOnSave
    autocmd!
    autocmd! BufWritePost * Neomake
augroup END

" Nerdtree   {{{2
nnoremap <silent><expr> <leader>t (winnr()==g:NERDTree.GetWinNum() ? ":NERDTreeClose\<CR>" : ":NERDTreeFocus\<CR>")
nnoremap <silent> <leader>f :NERDTreeFind<CR>
let NERDTreeAutoCenter=1
let NERDTreeAutoCenterThreshold=5
let NERDTreeChDirMode=2
let NERDTreeMinimalUI=1
let NERDTreeSortHiddenFirst=1
let NERDTreeShowBookmarks=1
let NERDTreeWinSize=42
let NERDTreeQuitOnOpen=1
let NERDTreeIgnore=['^ntuser\.', '^NTUSER\.']
let NERDTreeCascadeSingleChildDir = 0
let NERDTreeCascadeOpenSingleChildDir = 1
let NERDTreeMapActivateNode='l'
let NERDTreeMapOpenRecursively='L'
let NERDTreeMapCloseDir='h'

" Vifm   {{{2
nnoremap <silent> <leader>o :EditVifm<CR>

" Scratch   {{{2
let g:scratch_insert_autohide = 0
let g:scratch_no_mappings = 1
let g:scratch_persistence_file = $VIMHOME.'/tmp/scratch.txt'
nnoremap gs :Scratch<CR>
nnoremap gS :Scratch!<CR>
xnoremap gs :ScratchSelection<CR>
xnoremap gS :ScratchSelection!<CR>

" Undotree   {{{2
nnoremap <silent> <leader>u :UndotreeToggle<CR>
let g:undotree_SetFocusWhenToggle = 1
let g:undotree_WindowLayout = 2

" vim-snippets   {{{2
let g:snips_author = "Phil Runninger"
let g:snips_email = "prunninger@virtualhold.com"
let g:snips_github = "https://github.com/PhilRunninger"

" Color Settings and Status Line   {{{1
let g:gruvbox_contrast_dark = 'hard'
colorscheme gruvbox
set background=dark

let g:statusline_insert='cterm=none ctermfg=15 ctermbg=19 gui=none guifg=#ffffff guibg=#0000af'     " white on Blue
let g:statusline_modified='cterm=none ctermfg=15 ctermbg=52 gui=none guifg=#ffffff guibg=#5f0000'   " White on Dark Red
let g:statusline_unmodified='cterm=none ctermfg=15 ctermbg=22 gui=none guifg=#ffffff guibg=#005f00' " White on Dark Green

highlight WildMenu cterm=none ctermfg=16  ctermbg=178 guifg=#000000 guibg=#dfaf00  " Black on Gold
highlight User1    cterm=none ctermbg=17  ctermfg=12  guibg=#000080 guifg=#0087ff  " Blue on Dark Blue
highlight User2    cterm=none ctermbg=52  ctermfg=160 guibg=#5f0000 guifg=#df0000  " Red on Dark Red

function! StatuslineColor(mode)
  if a:mode == 'i'
    exec 'highlight StatusLine '.g:statusline_insert
  elseif &modified
    exec 'highlight StatusLine '.g:statusline_modified
  else
    exec 'highlight StatusLine '.g:statusline_unmodified
  endif
endfunction

if v:version > 703
  augroup set_statusline_colors
    autocmd!
    autocmd InsertEnter,InsertChange,TextChangedI * call StatuslineColor('i')
    autocmd InsertLeave,TextChanged,BufWritePost,BufEnter * call StatuslineColor('n')
  augroup END
endif

let g:currentmode={
    \ 'n'  : 'Normal',
    \ 'no' : 'N·Operator Pending',
    \ 'v'  : 'Visual',
    \ 'V'  : 'V·Line',
    \ '' : 'V·Block',
    \ 's'  : 'Select',
    \ 'S'  : 'S·Line',
    \ '' : 'S·Block',
    \ 'i'  : 'Insert',
    \ 'R'  : 'Replace',
    \ 'Rv' : 'V·Replace',
    \ 't'  : 'Terminal',
    \ 'c'  : 'Command',
    \ 'cv' : 'Vim Ex',
    \ 'ce' : 'Ex',
    \ 'r'  : 'Prompt',
    \ 'rm' : 'More',
    \ 'r?' : 'Confirm',
    \ '!'  : 'Shell',
    \}

set statusline=%3p%%\ %4v
set statusline+=\ %1*%(\ %{fugitive#head(8)}\ %)%*
set statusline+=%2*%(%{&modifiable?&readonly?\"\ ro\ \":\"\":\"\ RO\ \"}%)%*
set statusline+=\ %{&ft}
set statusline+=\ %{&ff}
set statusline+=\ %f
set statusline+=%=
set statusline+=\ %{g:currentmode[mode()]}

call StatuslineColor('n')

" Custom, machine-specific post processing   {{{1
let s:path = fnamemodify(resolve(expand('<sfile>:p')), ':h') . '/post_vimrc'
if filereadable(s:path)
  execute 'source' s:path
endif
