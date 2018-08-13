" vim: foldmethod=marker

let $VIMHOME=expand('<sfile>:p:h')

" Plugin Management  {{{1
silent! call plug#begin($VIMHOME.'/bundle')

    " Coding / Development
    Plug 'git@github.com:tpope/vim-fugitive'
    Plug 'git@github.com:Shougo/neosnippet'
    Plug 'git@github.com:w0rp/ale.git'
    Plug 'git@github.com:PhilRunninger/vim-snippets'
    Plug 'git@github.com:airblade/vim-gitgutter'
    Plug 'git@github.com:tpope/vim-commentary.git'
    Plug 'git@github.com:diepm/vim-rest-console.git', { 'for': 'rest' }
    Plug 'git@github.com:scrooloose/vim-slumlord'
    Plug 'git@github.com:aklt/plantuml-syntax', { 'for': 'uml' }

    " File Management
    Plug 'git@github.com:scrooloose/nerdtree'
    Plug 'git@github.com:PhilRunninger/nerdtree-buffer-ops.git'
    Plug 'git@github.com:jeetsukumaran/vim-buffergator.git'

    " Colorschemes
    Plug 'git@github.com:guns/xterm-color-table.vim', { 'on': 'XtermColorTable' }
    Plug 'git@github.com:morhetz/gruvbox.git'

    " Miscellaneous Utilities
    Plug 'git@github.com:sotte/presenting.vim.git', { 'on': 'PresentingStart' }
    Plug 'git@github.com:Shougo/neocomplete.vim'
    Plug 'git@github.com:mbbill/undotree', { 'on': 'UndotreeShow' }
    Plug 'git@github.com:junegunn/vim-easy-align'
    Plug 'git@github.com:mtth/scratch.vim'
    Plug 'git@github.com:PhilRunninger/vim-sessions.git'
    Plug 'git@github.com:kshenoy/vim-signature'
    Plug 'git@github.com:tpope/vim-repeat'
    Plug 'git@github.com:tpope/vim-surround'
    Plug 'git@github.com:tpope/vim-unimpaired'
    Plug 'git@github.com:tommcdo/vim-exchange.git'
    Plug 'git@github.com:chrisbra/Recover.vim.git'
    Plug 'git@github.com:ggVGc/vim-fuzzysearch.git'
    Plug 'git@github.com:lfv89/vim-interestingwords.git'

    " Filetype-specific
    Plug 'git@github.com:suan/vim-instant-markdown.git', { 'for': 'markdown' }
    Plug 'git@github.com:tpope/vim-markdown', { 'for': 'markdown' }
    Plug 'git@github.com:tpope/vim-jdaddy', { 'for': 'json' }
    Plug 'git@github.com:elzr/vim-json', { 'for': 'json' }
    Plug 'git@github.com:vim-scripts/NSIS-syntax-highlighting', { 'for': ['nsi', 'nsh'] }
    Plug 'git@github.com:chrisbra/csv.vim', { 'for': 'csv' }

    " Games
    Plug 'git@github.com:uguu-org/vim-matrix-screensaver.git', { 'on': 'Matrix' }
    Plug 'git@github.com:PhilRunninger/sokoban.vim.git', { 'on': ['Sokoban','SokobanH','SokobanV']}
    Plug 'git@github.com:katono/rogue.vim.git', { 'on': [ 'Rogue', 'RogueScores', 'RogueRestore', 'RogueResume' ] }

call plug#end()

" Miscellaneous settings   {{{1
set autoread                        " automatically read file when changed outside of vim
set encoding=utf-8                  " Sets the character encoding to use inside vim.
set scrolloff=3                     " Minimum # of lines above and below cursor
set sidescrolloff=3                 " minimum nr. of columns to left and right of cursor
set sidescroll=1                    " Minimum number of columns to scroll horizontal
set confirm                         " Ask what to do with unsave/read-only files
set tags=./tags;/                   " List of filenames used by the tag command
set backspace=indent,eol,start      " How backspace works at start of line
set whichwrap+=<,>,[,]              " Allow specified keys to cross line boundaries
set ttimeoutlen=10                  " Time out time for key codes in milliseconds (Removes delay after <Esc> in Command mode.)
let g:netrw_dirhistmax = 0          " Prevent creation of .netrwhist files.
let mapleader=" "                   " Character to use for <leader> mappings
syntax on                           " Turn syntax highlighting on.

" Change cursor shape between insert and normal mode in iTerm2.app
if $TERM_PROGRAM =~ "iTerm"
    let &t_SI = "\<Esc>]50;CursorShape=1\x7" " Vertical bar in insert mode
    let &t_EI = "\<Esc>]50;CursorShape=0\x7" " Block in normal mode
endif

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
set number          " print the line number in front of each line
set list                                            " show <tab> and <eol>
set listchars=tab:●·,extends:→,precedes:←,trail:■   " characters for displaying in list mode
set fillchars=stl:\ ,stlnc:\ ,vert:\                " characters to use for displaying special items
set showtabline=0                                   " tells when the tab pages line is displayed
set laststatus=2                                    " tells when last window has status line

" Undo/Backup/Swap file settings   {{{1
set undolevels=100                        " maximum number of changes that can be undone
set undofile                              " automatically save undo history to an undo file
set undodir=$VIMHOME/cache/undo//         " list of directory names for undo files
set directory=$VIMHOME/cache/swapfiles//  " list of directory names for swap files
set nobackup                              " [do not] keep backup file after overwriting a file
set backupdir=$VIMHOME/cache/backups//    " list of directory namde for the backup file

if !isdirectory(&undodir) | call mkdir(&undodir, 'p') | endif
if !isdirectory(&directory) | call mkdir(&directory, 'p') | endif
if !isdirectory(&backupdir) | call mkdir(&backupdir, 'p') | endif

" Disable the bells (audible and visual).   {{{1
set noerrorbells    " [do not] ring the bells for error messages
set visualbell      " use visual bell instead of beeping
set t_vb=

" Window behavior and commands   {{{1
set splitbelow      " new window from split is below the current one
set splitright      " new window is put right of the current one
set winminheight=0  " minimum number of lines for any window
set winminwidth=0   " minimum number of columns for any window

nnoremap <silent> <leader>w <C-W>
nnoremap <silent> <Up> 5<C-W>+
nnoremap <silent> <Down> 5<C-W>-
nnoremap <silent> <Right> 10<C-W>>
nnoremap <silent> <Left> 10<C-W><
nnoremap <silent> <leader>x <C-W>_<C-W>\|
nnoremap <silent> <C-H> <C-W>h
nnoremap <silent> <C-J> <C-W>j
nnoremap <silent> <C-K> <C-W>k
nnoremap <silent> <C-L> <C-W>l

" Buffer-related settings and mappings   {{{1
set hidden          " don't unload buffer when it is abandoned
nnoremap <silent> # :buffer #<CR>

" Searching settings   {{{1
set hlsearch        " highlight matches with last search pattern
set incsearch       " highlight match wile typing search pattern
set ignorecase      " ignore case in search patterns
set smartcase       " no ignore case when pattern has uppercase
runtime macros/matchit.vim
nnoremap <silent> n   nzzzv
nnoremap <silent> N   Nzzzv
vnoremap <silent> * :<C-U>
  \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
  \gvy/<C-R><C-R>=substitute(
  \escape(@", '/\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
  \gV:call setreg('"', old_reg, old_regtype)<CR>
nnoremap <silent> <leader>/ :vimgrep "<C-R>/" %<CR>n:copen<CR>
vnoremap <silent> <leader>/ y:vimgrep "<C-R>0" %<CR>/<C-R>0<CR>:copen<CR>
nnoremap <silent> <leader><space> :nohlsearch<CR>

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

" ############################ BREAK BAD HABITS! ############################ {{{1
" I keep pressing o on a fold to open it. Use za, zo, or zr instead, but don't give me a crutch.
nnoremap <expr> o foldclosed('.')==-1 ? "o" : ""

" Auto-command Definitions   {{{1
augroup reloadVimrc     " Re-source this file when saving it   {{{2
    autocmd!
    autocmd BufWritePost $MYVIMRC nested source $MYVIMRC
augroup END

augroup trailingSpaces  " Turn off trailing space indicator in Insert mode   {{{2
    autocmd!
    autocmd InsertEnter * :set listchars-=trail:■
    autocmd InsertLeave * :set listchars+=trail:■
augroup END

augroup bufferEvents    " Keep cursor in original position when switching buffers   {{{2
    autocmd!
    autocmd bufleave * let b:winview = winsaveview()
    autocmd bufenter * if(exists('b:winview')) | call winrestview(b:winview) | endif
augroup END
set nostartofline

augroup vimHelp         " Get help (with K key) when editing vimscript   {{{2
    autocmd!
    autocmd FileType vim setlocal keywordprg=:help
augroup END

augroup checktime       " terminal mode hack for autoread option   {{{2
    autocmd!
    if !has("gui_running")
        "silent! necessary; otherwise, throws errors when using command line window.
        autocmd BufEnter        * silent! checktime
        autocmd CursorHold      * silent! checktime
        autocmd CursorHoldI     * silent! checktime
        autocmd CursorMoved     * silent! checktime
        autocmd CursorMovedI    * silent! checktime
    endif
augroup END

augroup jumpToPreviousLocation         " When editing a file, always jump to its last known cursor position.   {{{2
    autocmd!
    autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | execute "normal! g`\"" | endif
augroup END

augroup pivotalTrackerIDToCommitMesage " Grab PivotalTracker ID and start commit message.  {{{2
    autocmd!
    autocmd BufReadPost COMMIT_EDITMSG execute "silent! normal! qzq/# On branch.\\{-}\\zs\\d\\{8,}\<CR>\"zy//e\<CR>gg\"zPI[#\<ESC>A] \<ESC>:1,1s/\\[#\\] //\<CR>"
augroup END

augroup vhtFileTypes                   " Set filetype of VHT Log files   {{{2
    autocmd!
    autocmd BufReadPost TIALOutputLog*.txt set filetype=vht
    autocmd BufReadPost MainOutputLog*.txt set filetype=vht
    autocmd BufReadPost IVROutputLog*.txt set filetype=vht
    autocmd BufReadPost info.log set filetype=vht
    autocmd BufReadPost debug.log set filetype=vht
    autocmd BufReadPost error.log set filetype=vht
    autocmd BufReadPost *.{[0123456789]}\\\{1,99\} set filetype=vht
augroup END

augroup nerdTreeEvents                 " NERDTree-specific events   {{{2
    autocmd!
    " Focus NERDTree on the current buffer
    autocmd BufEnter * call AutoNTFinder()
    " Prevent changing to another buffer in NERDTree window.
    autocmd BufEnter * if bufname('#') =~# "^NERD_tree_" | b# | endif
augroup END

function! AutoNTFinder()
    if g:NERDTree.IsOpen() && &buftype == ''
        let l:winnr = winnr()
        let l:altwinnr = winnr('#')

        :NERDTreeFind

        execute l:altwinnr . 'wincmd w'
        execute l:winnr . 'wincmd w'
    endif
endfunction

if v:version > 703                     " Change statusline color, depending on mode.   {{{2
    augroup setStatuslineColors
        autocmd!
        autocmd InsertEnter,InsertChange,TextChangedI * call StatuslineColor(1)
        autocmd InsertLeave,TextChanged,BufWritePost,BufEnter * call StatuslineColor(0)
    augroup END
endif

" Settings for managed plugins {{{1
    " FuzzySearch   {{{2
    let g:fuzzysearch_prompt = '🔍'
    let g:fuzzysearch_hlsearch = 0
    let g:fuzzysearch_max_history = 50
    let g:fuzzysearch_match_spaces = 1
    nnoremap \ :FuzzySearch<CR>

    " ALE   {{{2
    let g:ale_linters = {
                      \     'erlang': ['syntaxerl']
                      \ }

    function! LinterStatus() abort
        let l:counts = ale#statusline#Count(bufnr(''))
        let l:all_errors = l:counts.error + l:counts.style_error
        let l:all_non_errors = l:counts.total - l:all_errors
        return l:counts.total == 0 ? '' : printf( '%dW %dE', all_non_errors, all_errors)
    endfunction

    " Fugitive   {{{2
    nnoremap <silent> <F3> "zyiw/<C-R>z<CR>:Ggrep -e '<C-R>z'<CR><CR>:copen<CR>:redraw!<CR>
    vnoremap <silent> <F3> "zy/<C-R>z<CR>:Ggrep -e '<C-R>z'<CR><CR>:copen<CR>:redraw!<CR>

    " NeoSnippet   {{{2
    let g:neosnippet#disable_runtime_snippets = { '_' : 1  }
    let g:neosnippet#enable_snipmate_compatibility = 1
    let g:neosnippet#snippets_directory=$VIMHOME.'/bundle/vim-snippets/snippets'
    let g:neosnippet#data_directory=$VIMHOME.'/cache/neosnippet'

    imap <C-O> <Plug>(neosnippet_expand_or_jump)
    smap <C-O> <Plug>(neosnippet_expand_or_jump)
    xmap <C-O> <Plug>(neosnippet_expand_target)

    " vim-snippets   {{{2
    let g:snips_author = "Phil Runninger"
    let g:snips_email = "prunninger@vhtcx.com"
    let g:snips_github = "https://github.com/PhilRunninger"

    " NERDTree   {{{2
    nnoremap <silent> <leader>o :set lazyredraw<CR>:BuffergatorClose<CR>:NERDTreeFocus<CR>:set nolazyredraw<CR>
    nnoremap <silent> <leader>f :NERDTreeFind<CR>
    let NERDTreeAutoCenter =                1
    let NERDTreeAutoCenterThreshold =       5
    let NERDTreeIgnore =                    ['\c^ntuser\..*']
    let NERDTreeRespectWildIgnore =         1
    let NERDTreeBookmarksFile =             $VIMHOME.'/cache/.NERDTreeBookmarks'
    let NERDTreeQuitOnOpen =                1
    let NERDTreeWinSize =                   40
    let NERDTreeMinimalUI =                 1
    let NERDTreeCascadeSingleChildDir =     0
    let NERDTreeCascadeOpenSingleChildDir = 1
    let NERDTreeStatusline =                '%#NonText#'

    " Buffergator   {{{2
    nnoremap <silent> <leader>b :set lazyredraw<CR>:NERDTreeClose<CR>:BuffergatorOpen<CR>:set nolazyredraw<CR>
    let g:buffergator_split_size = 40
    let g:buffergator_suppress_keymaps = 1
    let g:buffergator_show_full_directory_path = 0
    let g:buffergator_sort_regime = "basename"

    " Presenting   {{{2
    let g:presenting_top_margin = 2

    " NeoComplCache   {{{2
    set completeopt=longest,menuone

    let g:neocomplete#enable_ignore_case = 1
    let g:neocomplete#enable_smart_case = 1
    let g:neocomplete#enable_fuzzy_completion = 1
    let g:neocomplete#enable_at_startup = 1
    let g:neocomplete#data_dir=$VIMHOME.'/cache/neocomplete'
    inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
    inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<S-TAB>"
    inoremap <expr><Space> pumvisible() ? "\<C-y><Space>" : "\<Space>"
    inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"

    " Undotree   {{{2
    nnoremap <silent> <leader>u :UndotreeShow<CR>
    let g:undotree_TreeNodeShape = '●'
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
    set sessionoptions-=tabpages
    let g:pathToSessions = $VIMHOME.'/cache/sessions'

    " rogue   {{{2
    let g:rogue#name = 'Ṕḧįḹ'
    let g:rogue#directory = $VIMHOME.'/cache'
    let g:rogue#fruit = 'pizza'

" Color Settings and Status Line   {{{1
colorscheme gruvbox

highlight Normal                                ctermbg=16   " Black Background
highlight Folded         cterm=none ctermfg=239 ctermbg=232  " Gray on Almost Black
highlight MatchParen     cterm=bold ctermfg=5   ctermbg=none " Magenta
highlight WildMenu       cterm=none ctermfg=16  ctermbg=178  " Black on Gold
highlight GitBranch      cterm=none ctermfg=12  ctermbg=17   " Blue on Dark Blue
highlight Insert         cterm=none ctermfg=15  ctermbg=27   " White on Blue
highlight NormalMod      cterm=none ctermfg=15  ctermbg=124  " White on Red
highlight NormalNoMod    cterm=none ctermfg=16  ctermbg=40   " Black on Green
highlight StatusLineTerm cterm=none ctermfg=16  ctermbg=208  " Black on Gold
highlight! link Session WildMenu
highlight! link StatusLineTermNC StatusLineNC
highlight! link VertSplit StatusLineNC

function! StatuslineColor(insertMode)
    exec 'highlight! link StatusLine ' . (a:insertMode ? 'Insert' : (&modified ? 'NormalMod' : 'NormalNoMod'))
endfunction

function! Map_ff()
    return get({ "unix": "␊", "mac": "␍", "dos": "␍␊" }, &ff, "?")
endfunction

function! Map_ro_mod()
    return (&modifiable ? (&readonly ? "🔐" : "") : "🔒") . (&modified ? "🔴" : "")
endfunction

set statusline=%3p%%\ %4v
set statusline+=\ %#GitBranch#%(\ %{fugitive#head(8)}\ %)%*
set statusline+=\ %{Map_ro_mod()}
set statusline+=\ %{&ft}
set statusline+=\ %{Map_ff()}
set statusline+=\ %f
set statusline+=%=
set statusline+=%#ErrorMsg#%(\ %{LinterStatus()}\ %)%*
set statusline+=%#Session#%(\ %{SessionNameStatusLineFlag()}\ %)%*

call StatuslineColor(0)

" Custom, machine-specific post processing   {{{1
let s:path = fnamemodify(resolve(expand('<sfile>:p')), ':h') . '/post_vimrc'
if filereadable(s:path)
    execute 'source' s:path
endif
