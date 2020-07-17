" vim: foldmethod=marker

let $VIMHOME=expand('<sfile>:p:h')

" Plugin Management  {{{1

" Add new packages as submodules like so:
"   cd ~/.vim
"   git submodule add --name nerdtree git@github.com:scrooloose/nerdtree pack/bundle/opt/nerdtree
"
" Remove submodules with these instructions:
"   https://davidwalsh.name/git-remove-submodule

function! s:Install(name, ...)   "{{{2
    " name - plugin's submodule name as given in `git submodule add` command.
    " a:1 - an optional dictionary that determines whether to install the plugin.
    if a:0>0 && ( (has_key(a:1,'has')     && !has(a:1['has'])) ||
                \ (has_key(a:1,'exists')  && !exists(a:1['exists'])) ||
                \ (has_key(a:1,'version') && v:version < a:1['version']) )
        echomsg "  Plugin ".a:name." was not loaded. Disqualifying Prerequisite: ".string(a:1)
        return
    endif

    if has("packages")
        execute 'packadd! '.a:name
    else
        if !exists("*pathogen#infect")
            source $VIMHOME/pack/pathogen/opt/vim-pathogen/autoload/pathogen.vim
        endif
        call pathogen#infect('pack/**/opt/'.a:name)
    endif
endfunction  "}}}2

" Coding / Development
    call s:Install('vim-fugitive')
    call s:Install('vim-gitgutter')
    call s:Install('vim-commentary')
    call s:Install('vim-rest-console')
    call s:Install('Improved-AnsiEsc')
" File Management
    call s:Install('mintree', {'version':'800'})
    call s:Install('nerdtree')
    " call s:Install('vim-devicons')
    call s:Install('nerdtree-buffer-ops')
    call s:Install('nerdtree-visual-selection')
    call s:Install('bufselect', {'version':'800'})
" Colorschemes
    call s:Install('xterm-color-table')
    call s:Install('gruvbox')
" Miscellaneous Utilities
    call s:Install('tabline')
    call s:Install('neocomplete', {'has':'lua'})
    call s:Install('undotree')
    call s:Install('vim-easy-align')
    call s:Install('scratch')
    call s:Install('vim-sessions')
    call s:Install('vim-signature')
    call s:Install('vim-repeat')
    call s:Install('vim-surround')
    call s:Install('vim-unimpaired')
    call s:Install('vim-exchange')
    call s:Install('Recover')
    call s:Install('unicode')
    call s:Install('vim-illuminate')
" Filetype-specific
    call s:Install('vim-jdaddy')
    call s:Install('vim-json')
    call s:Install('NSIS-syntax-highlighting')
    call s:Install('csv')
" Fun & Games
    call s:Install('ldraw')
    call s:Install('sokoban')
    call s:Install('rogue')
    call s:Install('robots')
    call s:Install('vim-matrix-screensaver')

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
set tags=./tags;/                   " List of filenames used by the tag command
set backspace=indent,eol,start      " How backspace works at start of line
set ttimeoutlen=10                  " Time out time for key codes in milliseconds (Removes delay after <Esc> in Command mode.)
set diffopt+=iwhite
let mapleader=' '                   " Character to use for <leader> mappings

" Disable netrw
let g:loaded_netrw       = 1
let g:loaded_netrwPlugin = 1

" Markdown settings
let g:markdown_folding = 1
let g:markdown_fenced_languages = ['vim']

" Change cursor shape between insert and normal mode in iTerm2.app
if $TERM_PROGRAM =~ "iTerm"
    let &t_SI = "\<Esc>]50;CursorShape=1\x7" " Vertical bar in insert mode
    let &t_EI = "\<Esc>]50;CursorShape=0\x7" " Block in normal mode
endif

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

" Disable the bells (audible and visual).   {{{1
set noerrorbells visualbell t_vb=

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

" Move visual selection up/down with ease {{{2
xnoremap K :move '<-2<CR>gv-gv
xnoremap J :move '>+1<CR>gv-gv

" Auto-command Definitions   {{{1
augroup reloadVimrc            " Re-source this file when saving it   {{{2
    autocmd!
    autocmd BufWritePost $MYVIMRC nested source $MYVIMRC
augroup END

augroup removeTrailingSpaces   " Remove trailing on save {{{2
    autocmd!
    autocmd BufWrite * %s/\s\+$//ce
augroup END

if has('terminal')             " Turn off line numbers in Terminal windows.   {{{2
    augroup terminalSettings
        autocmd!
        autocmd TerminalOpen * if &buftype == 'terminal' | setlocal nonumber | endif
    augroup END
endif

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

augroup customFileTypes        " Set filetype of files, based on extension  {{{2
    autocmd!
    autocmd BufReadPost *.ldr,*.mpd set filetype=ldraw
augroup END

augroup setStatuslineColors    " Change statusline color, depending on mode.   {{{2
    autocmd!
    autocmd InsertEnter,InsertChange,TextChangedI * call StatuslineColor(1)
    autocmd InsertLeave,TextChanged,BufWritePost,BufEnter * call StatuslineColor(0)
augroup END

" Settings for managed plugins {{{1
    " ANSIEsc   {{{2
    nnoremap <leader>a :AnsiEsc<CR>

    " Fugitive   {{{2
    nnoremap <silent> <F3> "zyiw/<C-R>z<CR>:Ggrep -e '<C-R>z'<CR><CR>:copen<CR>:redraw!<CR>
    vnoremap <silent> <F3> "zy/<C-R>z<CR>:Ggrep -e '<C-R>z'<CR><CR>:copen<CR>:redraw!<CR>
    nnoremap <leader>G :Gstatus<CR>

    " NERDTree   {{{2
    let NERDTreeIgnore            = ['\c^ntuser\..*']
    let NERDTreeRespectWildIgnore = 1
    let NERDTreeBookmarksFile     = $VIMHOME.'/cache/.NERDTreeBookmarks'
    let NERDTreeQuitOnOpen        = 1
    let NERDTreeMinimalUI         = 1
    let NERDTreeMapOpenSplit      = 's'
    let NERDTreeMapOpenVSplit     = 'v'
    " let NERDTreeDirArrowCollapsible = ''
    " let NERDTreeDirArrowExpandable = ''
    let NERDTreeNaturalSort=1

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

    " REST Console   {{{2
    let g:vrc_show_command = 1
    augroup RESTConsole
        autocmd!
        autocmd FileType rest nunmap <buffer> <C-J>
        autocmd FileType rest nnoremap <buffer> <silent> <leader>c :call VrcQuery()<CR>
    augroup END

    " NeoComplete   {{{2
    set completeopt=longest,menuone
    let g:neocomplete#enable_ignore_case = 1
    let g:neocomplete#enable_smart_case = 1
    let g:neocomplete#enable_fuzzy_completion = 1
    let g:neocomplete#enable_at_startup = 1
    let g:neocomplete#data_directory=$VIMHOME.'/cache/neocomplete'
    inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
    inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<S-TAB>"
    inoremap <expr><Space> pumvisible() ? "\<C-y><Space>" : "\<Space>"

    " Undotree   {{{2
    nnoremap <silent> <leader>u :UndotreeShow<CR>
    let g:undotree_SetFocusWhenToggle = 1
    let g:undotree_WindowLayout = 2
    let g:undotree_HelpLine = 0
    let g:undotree_ShortIndicators = 1

    " EasyAlign   {{{2
    vmap <Enter> <Plug>(EasyAlign)

    " Scratch   {{{2
    let g:scratch_insert_autohide = 0
    let g:scratch_no_mappings = 1
    let g:scratch_persistence_file = $VIMHOME.'/cache/scratch.txt'
    nnoremap gs :Scratch<CR>
    nnoremap gS :Scratch!<CR>
    xnoremap gs :ScratchSelection<CR>
    xnoremap gS :ScratchSelection!<CR>

    " vim-sessions   {{{2
    set sessionoptions-=help
    set sessionoptions-=blank

    " rogue   {{{2
    let g:rogue#name = 'Ṕḧįḹ'
    let g:rogue#directory = $VIMHOME.'/cache'
    let g:rogue#fruit = 'pizza'

    " unicode   {{{2
    nnoremap ga :UnicodeName<CR>
    inoremap <C-K> <Esc>:UnicodeSearch!<space>

" Color Settings and Status Line   {{{1
command! FixColors :call <SID>EstablishColors()
function! s:EstablishColors()
    colorscheme gruvbox
    set background=dark

    unlet! g:colors_name   " Why? See :h :hi-normal-cterm
    highlight Normal                                ctermbg=NONE " Use terminal's Background color setting
    highlight Folded         cterm=none ctermfg=8   ctermbg=234  " Gray on Almost Black
    highlight MatchParen     cterm=bold ctermfg=1   ctermbg=none " Red
    highlight WildMenu       cterm=none ctermfg=16  ctermbg=178  " Black on Gold
    highlight GitBranch      cterm=none ctermfg=12  ctermbg=17   " Blue on Dark Blue
    highlight Insert         cterm=none ctermfg=15  ctermbg=27   " White on Blue
    highlight NormalMod      cterm=none ctermfg=15  ctermbg=124  " White on Red
    highlight NormalNoMod    cterm=none ctermfg=16  ctermbg=40   " Black on Green
    highlight StatusLineTerm cterm=none ctermfg=16  ctermbg=208  " Black on Gold
    highlight! link Session WildMenu
    highlight! link StatusLineTermNC StatusLineNC
    highlight! link VertSplit StatusLineNC
endfunction
call s:EstablishColors()

function! StatuslineColor(insertMode)
    exec 'highlight! link StatusLine ' . (a:insertMode ? 'Insert' : (&modified ? 'NormalMod' : 'NormalNoMod'))
endfunction

function! Map_ff()
    return get({ "unix": "␊", "mac": "␍", "dos": "␍␊" }, &ff, "?")
endfunction

function! Map_ro_mod()
    return (&modifiable ? (&readonly ? "🔐" : "") : "🔒") . (&modified ? "🔴" : "")
endfunction

function! AbbreviatedPath()
    let path = split(fnamemodify(bufname('%'),':.'), '[/\\]')
    let path = map(copy(path)[0:-2], 'substitute(v:val,"\\.\\?.\\zs.*","","")') + [path[-1]]
    return join(path, '/')
endfunction

function! Status(winnum)
    let l:statusline=""
    if a:winnum == winnr()
        let l:statusline.="%3v"
        let l:statusline.="\ %#GitBranch#%(\ %{fugitive#head(8)}\ %)%*"
        let l:statusline.="\ %{&ft}"
        let l:statusline.="\ %{Map_ff()}"
        let l:statusline.="%(\ %{Map_ro_mod()}%)"
        let l:statusline.="\ %{AbbreviatedPath()}"
        let l:statusline.="%="
        let l:statusline.="%#Session#%(\ %{SessionNameStatusLineFlag()}\ %)%*"
    else
        let l:statusline.="%(\ %{Map_ro_mod()}%)"
        let l:statusline.="\ %F"
    endif
    return l:statusline
endfunction

function! s:RefreshStatus()
    let l:exempt  = ['']                        " No name (Quickfix/Location list, new file, etc.)
    let l:exempt += ['.*[/\\]doc[/\\]\w*\.txt'] " Help files
    let l:exempt += ['=MinTree=']               " MinTree
    let l:exempt += ['NERD_tree_\d\+']          " NERDTree
    let l:exempt += ['=Buffers=']               " BufSelect list
    for nr in range(1, winnr('$'))
        if bufname(winbufnr(nr)) !~# '^\(' . join(l:exempt,'\|') . '\)$'
            call setwinvar(nr, '&statusline', '%!Status('.nr.')')
        endif
    endfor
endfunction

augroup StatusLine
    autocmd!
    autocmd VimEnter,WinEnter,BufWinEnter * call <SID>RefreshStatus()
augroup END

call StatuslineColor(0)
