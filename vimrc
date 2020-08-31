" vim: foldmethod=marker

let $VIMHOME=expand('<sfile>:p:h')

" Plugins   {{{1
" NERDTree and its Extensions
    packadd! nerdtree
    packadd! nerdtree-buffer-ops
    packadd! nerdtree-visual-selection
    " packadd! vim-devicons
    " packadd! nerdtree-git-plugin
    " packadd! vim-nerdtree-syntax-highlight

" My Other Plugins
    packadd! vim-sessions
    packadd! bufselect.vim
    packadd! mintree

" Fun & Games
    packadd! ldraw.vim
    packadd! sokoban.vim
    packadd! rogue.vim
    packadd! vim-robots
    packadd! vim-matrix-screensaver

" Must come AFTER the :packadd! calls above; otherwise, the contents of package 'ftdetect'
" directories won't be evaluated.
filetype indent plugin on
syntax on                           " Turn syntax highlighting on.

" Miscellaneous settings   {{{1
set path+=**                        " search recursively for files with :find
set autoread                        " automatically read file when changed outside of vim
set encoding=utf-8                  " Sets the character encoding to use inside vim.
set scrolloff=3 sidescrolloff=3     " minimum # of rows/columns from cursor to edge of window
set sidescroll=1                    " Minimum number of columns to scroll horizontal
set nostartofline                   " [do not] move cursor to first non-blank column when paging
set hidden                          " don't unload buffer when it is abandoned
set confirm                         " Ask what to do with unsave/read-only files
set backspace=indent,eol,start      " How backspace works at start of line
set ttimeoutlen=10                  " Time out time for key codes in milliseconds (Removes delay after <Esc> in Command mode.)
set diffopt+=iwhite
let mapleader=' '                   " Character to use for <leader> mappings

" Searching settings   {{{2
set hlsearch incsearch
set ignorecase smartcase

" Command line options   {{{1
set history=1000
set wildmenu wildignorecase
set wildignore+=*.a,*.o,*.beam
set wildignore+=*.bmp,*.gif,*.jpg,*.ico,*.png
set wildignore+=.DS_Store,.git,.ht,.svn
set wildignore+=*~,*.swp,*.tmp

" Tab settings and behavior   {{{1
set autoindent smartindent
set softtabstop=4 tabstop=4 shiftwidth=4 expandtab

" Which things are displayed on screen?   {{{1
set showcmd         " show (partial) command in last line of screen
set noshowmode      " [no] message on status line show current mode
set showmatch       " briefly jump to matching bracket if inserting one
set number          " print the line number in front of each line
set list listchars=tab:●·,extends:→,precedes:←,trail:■  " characters for displaying in list mode
set fillchars=stl:\ ,stlnc:\ ,vert:\                    " characters to use for displaying special items
set laststatus=2                                        " tells when last window has status line

" Undo/Backup/Swap file settings   {{{1
set undolevels=500 undofile undodir=$VIMHOME/cache/undo//
if !isdirectory(&undodir) | call mkdir(&undodir, 'p') | endif

set directory=$VIMHOME/cache/swapfiles//
if !isdirectory(&directory) | call mkdir(&directory, 'p') | endif

set nobackup backupdir=$VIMHOME/cache/backups//
if !isdirectory(&backupdir) | call mkdir(&backupdir, 'p') | endif

" Window behavior and commands   {{{1
set splitbelow splitright          " new window is put below or right of the current one
set winminheight=0 winminwidth=0   " minimum number of rows or columns for any window

" Shortcut to <C-W> because of the MacBook's stupid Ctrl key placement
nnoremap <silent> <leader>w <C-W>

" Resize windows
nnoremap <silent> <Up> 5<C-W>+
nnoremap <silent> <Down> 5<C-W>-
nnoremap <silent> <Right> 10<C-W>>
nnoremap <silent> <Left> 10<C-W><
nnoremap <silent> <S-Up> <C-W>+
nnoremap <silent> <S-Down> <C-W>-
nnoremap <silent> <S-Right> <C-W>>
nnoremap <silent> <S-Left> <C-W><
nnoremap <silent> <leader>x <C-W>_<C-W>\|

" Navigate Windows and Tabs
function! WinTabSwitch(direction)
    let info = getwininfo(win_getid())[0]
    let wincol = win_screenpos(winnr())[1]
    if a:direction == 'h' && wincol <= 1
        execute 'tabprev|99wincmd l'
    elseif a:direction == 'l' && wincol + info.width >= &columns
        execute 'tabnext|99wincmd h'
    else
        execute 'wincmd '.a:direction
    endif
endfunction

nnoremap <silent> <C-H> :call WinTabSwitch('h')<CR>
nnoremap <silent> <C-J> :call WinTabSwitch('j')<CR>
nnoremap <silent> <C-K> :call WinTabSwitch('k')<CR>
nnoremap <silent> <C-L> :call WinTabSwitch('l')<CR>

" Make similar mappings for terminal mode.
if has("terminal")
    tnoremap \w <C-W>
    tnoremap <Esc><Esc> <C-W>N<CR>
    tnoremap <PageUp> <C-W>N<C-B>
    tnoremap <PageDown> <C-W>N<C-F>
    tnoremap <silent> <C-H> <C-W>:call WinTabSwitch('h')<CR>
    tnoremap <silent> <C-J> <C-W>:call WinTabSwitch('j')<CR>
    tnoremap <silent> <C-K> <C-W>:call WinTabSwitch('k')<CR>
    tnoremap <silent> <C-L> <C-W>:call WinTabSwitch('l')<CR>
endif

" Some helpful remappings {{{1
" Make # go to the alternate buffer   {{{2
nnoremap <silent> # :buffer #<CR>

" Improved searching mappings   {{{2
runtime macros/matchit.vim
nnoremap <silent> <leader><space> :set hlsearch!<CR>

" Swap j/k with gj/gk {{{2
nnoremap j gj
nnoremap k gk
nnoremap gj j
nnoremap gk k

" Show/hide cursorline and cursorcolumn   {{{2
nnoremap <silent> + :set cursorline! cursorcolumn!<CR>
nnoremap <silent> - :set cursorline!<CR>
nnoremap <silent> \| :set cursorcolumn!<CR>

" Change cwd to current buffer's directory   {{{2
nnoremap <leader>cd :cd %:p:h<CR>:pwd<CR>

" Show what highlighting is used under the cursor {{{2
nnoremap <F10> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<' . synIDattr(synID(line("."),col("."),0),"name") . "> lo<" . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>

" Fold-related mappings {{{2
" Don't allow o to work on a fold.
nnoremap <expr> o foldclosed('.')==-1 ? "o" : ""
" Focus on the current fold, opening it and closing all others.
nnoremap <leader>z zMzvzz

" Insert current date and/or time in insert mode {{{2
inoremap Dt =strftime("%-m/%-d/%y %-H:%M:%S")<CR><Space>
inoremap Dd =strftime("%-m/%-d/%y")<CR><Space>
inoremap Tt =strftime("%-H:%M:%S")<CR><Space>

" Auto-command Definitions   {{{1

augroup removeTrailingSpaces   " Remove trailing on save {{{2
    autocmd!
    autocmd BufWrite * %s/\s\+$//ce
augroup END

augroup trailingSpaces         " Turn off trailing space indicator in Insert mode   {{{2
    autocmd!
    autocmd InsertEnter * :set listchars-=trail:■
    autocmd InsertLeave * :set listchars+=trail:■
augroup END

if !&diff                      " Keep cursor in original position when switching buffers   {{{2
    augroup bufferEvents
        autocmd!
        autocmd BufLeave * let b:winview = winsaveview()
        autocmd BufEnter * if exists('b:winview') | call winrestview(b:winview) | endif
    augroup END
endif

augroup vimHelp                " Get help (with K key) when editing vimscript   {{{2
    autocmd!
    autocmd FileType vim setlocal keywordprg=:help
augroup END

if !has('gui_running')         " terminal mode hack for autoread option   {{{2
    augroup checkTime
        autocmd!
        "silent! necessary; otherwise, throws errors when using command line window.
        autocmd BufEnter        * silent! checktime
        autocmd CursorHold      * silent! checktime
        autocmd CursorHoldI     * silent! checktime
        autocmd CursorMoved     * silent! checktime
        autocmd CursorMovedI    * silent! checktime
    augroup END
endif

augroup jumpToPreviousLocation " When editing a file, always jump to its last known cursor position.   {{{2
    autocmd!
    autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | execute "normal! g`\"" | endif
augroup END

" Settings for managed plugins {{{1
    " NERDTree   {{{2
    let NERDTreeIgnore            = ['\c^ntuser\..*']
    let NERDTreeRespectWildIgnore = 1
    let NERDTreeBookmarksFile     = $VIMHOME.'/cache/.NERDTreeBookmarks'
    let NERDTreeQuitOnOpen        = 0
    let NERDTreeMinimalUI         = 1
    let NERDTreeMapOpenSplit      = 's'
    let NERDTreeMapOpenVSplit     = 'v'
    " let NERDTreeDirArrowCollapsible = ''
    " let NERDTreeDirArrowExpandable = ''
    let NERDTreeNaturalSort=1
    let NERDTreeCustomOpenArgs= {'file': {'reuse': 'all', 'where': 'p', 'keepopen':0, 'stay':0}, 'dir':{}}

    " BufSelect   {{{2
    let g:BufSelectSortOrder = "Extension"

    " File/Buffer Explorer Setup {{{2
    let g:MinTree = 0
    function! s:SwitchFileBrowser()
        let g:MinTree = !g:MinTree
        if g:MinTree
            nnoremap <silent> <expr><leader>o bufname('%') == '-=[Buffers]=-' ? ":set lazyredraw\<CR>:normal q\<CR>:MinTree\<CR>:set nolazyredraw\<CR>" : ":MinTree\<CR>"
            nnoremap <silent> <leader>f :MinTreeFind<CR>
            nnoremap <silent> <expr><leader>b bufname('%') == '=MinTree=' ? ":set lazyredraw\<CR>:normal q\<CR>:ShowBufferList\<CR>:set nolazyredraw\<CR>" : ":ShowBufferList\<CR>"
        else
            nnoremap <silent> <expr><leader>o bufname('%') == '-=[Buffers]=-' ? ":set lazyredraw\<CR>:normal q\<CR>:NERDTreeFocus\<CR>:set nolazyredraw\<CR>" : ":NERDTreeFocus\<CR>"
            nnoremap <silent> <leader>f :NERDTreeFind<CR>
            nnoremap <silent> <leader>b :set lazyredraw<CR>:NERDTreeClose<CR>:ShowBufferList<CR>:set nolazyredraw<CR>
        endif
    endfunction

    call s:SwitchFileBrowser()
    nnoremap <silent> <leader>t :call <SID>SwitchFileBrowser()<CR>:echomsg "Now using ".(g:MinTree?"MinTree.":"NERDTree.")<CR>

    " vim-sessions   {{{2
    set sessionoptions-=help sessionoptions-=blank

    " rogue   {{{2
    let g:rogue#name = 'Ṕḧįḹ'
    let g:rogue#directory = $VIMHOME.'/cache'
    let g:rogue#fruit = 'pizza'
