let $VIMHOME=expand('<sfile>:p:h')
execute 'source' $VIMHOME . '/vundlerc'

:let g:netrw_dirhistmax = 0

set encoding=utf-8
syntax on

set history=1000
set showcmd
set wildmenu
set wildmode=full
set wildignore+=*.a,*.o
set wildignore+=*.bmp,*.gif,*.jpg,*.ico,*.png
set wildignore+=.DS_Store,.git,.ht,.svn
set wildignore+=*~,*.swp,*.tmp
set wildignorecase

" Searching settings
set hlsearch    " highlight search results
set incsearch   " incremental searching
set ignorecase  " case insensitive search
set smartcase   " ... unless using capital letters

runtime macros/matchit.vim
nnoremap <silent> n   nzzzv
nnoremap <silent> N   Nzzzv

nnoremap j gj
nnoremap k gk
set backspace=indent,eol,start  " backspace and cursor keys wrap to previous/next line
set whichwrap+=<,>,[,]

set autoread
augroup checktime
  au!
  if !has("gui_running")
    "silent! necessary otherwise throws errors when using command line window.
    autocmd BufEnter        * silent! checktime
    autocmd CursorHold      * silent! checktime
    autocmd CursorHoldI     * silent! checktime
    "these two _may_ slow things down. Remove if they do.
    autocmd CursorMoved     * silent! checktime
    autocmd CursorMovedI    * silent! checktime
  endif
augroup END
set confirm

" tab settings and behavior
set autoindent
set smartindent
set softtabstop=2
set tabstop=2
set shiftwidth=2
set expandtab

set scrolloff=3
set showmatch
set number
set list
set fillchars=stl:\ ,stlnc:\ ,vert:\ 
if has("win32")
  set listchars=tab:†.,extends:»,precedes:«,trail:¤
else
  set listchars=tab:†.,extends:»,precedes:«,trail:●
endif
set tags=./tags;/

" Disable the bells (audible and visual).
set noerrorbells visualbell t_vb=
autocmd GUIEnter * set visualbell t_vb=

" Window behavior and commands
nnoremap <silent> <C-K> :wincmd k<CR>
nnoremap <silent> <C-J> :wincmd j<CR>
nnoremap <silent> <C-H> :wincmd h<CR>
nnoremap <silent> <C-L> :wincmd l<CR>
nnoremap <silent> <S-Up>  :resize +5<CR>
nnoremap <silent> <S-Down> :resize -5<CR>
nnoremap <silent> <S-Right>  :vertical resize +10<CR>
nnoremap <silent> <S-Left> :vertical resize -10<CR>
set splitbelow
set splitright
set winminheight=0
set winminwidth=0

set hidden
set showtabline=0

set undolevels=100
set undofile
set undodir=$VIMHOME/tmp/undo//
set directory=$VIMHOME/tmp/swapfiles//
set nobackup
set backupdir=$VIMHOME/tmp/backups//

" When editing a file, always jump to its last known cursor position.
autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif

" Set syntax highlighting for our log files
autocmd BufRead,BufNewFile MainOutputLog*.txt setfiletype vht

let mapleader=" "

" mapping to change cwd to current buffer's directory
nnoremap <leader>cd :cd %:p:h<CR>:pwd<CR>

" Remove trailing spaces
nnoremap <leader>d<space> :%s/\s\+$//c<CR>

" Convert Erlang "list strings" to <<"binary strings">>, and back again.
nnoremap <> m`f"a>><ESC>,,i<<<ESC>``ll
nnoremap >< m`f"lxx,,XX``hh

" Grab PivotalTracker ID and start commit message.
autocmd BufReadPost COMMIT_EDITMSG execute "silent! normal! qzq/# On branch.\\{-}\\zs\\d\\{8,}\<CR>\"zy//e\<CR>gg\"zPI[#\<ESC>A] \<ESC>:1,1s/\\[#\\] //\<CR>"

" Set filetype of VHT Log files
autocmd BufReadPost MainOutputLog*.txt set filetype=vht
autocmd BufReadPost IVROutputLog*.txt set filetype=vht

" Set statusline
set statusline=\ %v\ %3*%{fugitive#statusline()}%*\ %f\ #%n
set statusline+=\ %1*%{&modifiable?&readonly?\"\ ro\ \":\"\":\"\ RO\ \"}%*
set statusline+=\ %2*%{&modified?\"\ mod\ \":\"\"}%*
set statusline+=%=%{&ft}\ %{&ff}\ %p%%\ 

" Cycle through NERDTree, BufExplorer, and other buffers.
nnoremap <silent><expr> <Tab>   bufname(winbufnr(0))=='[BufExplorer]' ? ":ToggleBufExplorer\<CR>" : (bufname(winbufnr(0))=~'NERD_Tree_\d\+' ? ":NERDTreeToggle\<CR>:ToggleBufExplorer\<CR>" : ":NERDTreeToggle\<CR>")
nnoremap <silent><expr> <S-Tab> bufname(winbufnr(0))=='[BufExplorer]' ? ":ToggleBufExplorer\<CR>:NERDTreeToggle\<CR>" : (bufname(winbufnr(0))=~'NERD_Tree_\d\+' ? ":NERDTreeToggle\<CR>" : ":ToggleBufExplorer\<CR>")
nnoremap <silent> # :b#<CR>

"##########################################################################
"# Settings for managed plugins                                           #
"##########################################################################
" BufExplorer
nnoremap <silent> <leader>b :ToggleBufExplorer<CR>
let g:bufExplorerDisableDefaultKeyMapping=1
let g:bufExplorerShowNoName=1
let g:bufExplorerDefaultHelp=0
let g:bufExplorerDetailedHelp=0

" CursorCross
let g:cursorcross_dynamic = 'w'
nnoremap <silent> + :set cursorline! cursorcolumn!<CR>

" EasyAlign
vmap <Enter> <Plug>(EasyAlign)

" Fugitive
set laststatus=2
nnoremap <silent> <F3> "zyiw/<C-R>z<CR>:Ggrep -e '<C-R>z'<CR><CR>:copen<CR>:redraw!<CR>
vnoremap <silent> <F3> "zy/<C-R>z<CR>:Ggrep -e '<C-R>z'<CR><CR>:copen<CR>:redraw!<CR>

" NeoComplCache
let g:neocomplcache_enable_fuzzy_completion = 1
let g:neocomplcache_enable_at_startup = 1
inoremap <expr> <TAB>   pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr> <S-TAB> pumvisible() ? "\<C-p>" : "\<S-TAB>"

" Nerdtree
nnoremap <silent> <leader>t :NERDTreeToggle<CR>
let NERDTreeMinimalUI=1
let NERDTreeSortHiddenFirst=1
let NERDTreeShowBookmarks=1
let NERDTreeWinSize=42
let NERDTreeQuitOnOpen=1
let NERDTreeIgnore=['^ntuser\.', '^NTUSER\.', '^deps$', '^ebin$']

" Scratch
let g:scratch_insert_autohide = 0

" Undotree
nnoremap <silent> <leader>u :UndotreeToggle<CR>
let g:undotree_SetFocusWhenToggle = 1
let g:undotree_TreeNodeShape = '◘'
let g:undotree_WindowLayout = 2

"##########################################################################
"# END: Settings for managed plugins                                      #
"##########################################################################

colorscheme solarized
set background=light

if has("win32")
  hi User1 ctermbg=10 ctermfg=0 guibg=#20ff20 guifg=#010101 gui=NONE
  hi User2 ctermbg=12 ctermfg=7 guibg=#ff2020 guifg=white   gui=NONE
  hi User3 ctermbg=9  ctermfg=7 guibg=#20207f guifg=white   gui=bold
else
  hi WildMenu cterm=reverse ctermfg=208 ctermbg=0 guifg=Orange guibg=Black
  hi User1 ctermbg=40  ctermfg=0 guibg=#20ff20 guifg=#010101 gui=NONE
  hi User2 ctermbg=196 ctermfg=7 guibg=#ff2020 guifg=white   gui=NONE
  hi User3 ctermbg=20  ctermfg=7 guibg=#20207f guifg=white   gui=bold
endif

"##########################################################################
" Give an opportunity to override anything done by this script.
" http://stackoverflow.com/a/18734557/510067
let s:path = fnamemodify(resolve(expand('<sfile>:p')), ':h') . '/post_vimrc'
if filereadable(s:path)
  execute 'source' s:path
endif
"##########################################################################
