if has("mac")
  " To fix the fullscreen bug in MacOSX, http://shorts.jeffkreeftmeijer.com/2014/full-screen-macvim-on-yosemite/
  set fullscreen
else
  set lines=9999 columns=9999
endif

set nocursorline nocursorcolumn
if has("win32") || has("win16")
    set guifont=Consolas:h9
elseif has("mac")
    set guifont=Menlo:h12
else
    set guifont=Monospace\ 9
endif
set listchars=tab:†.,extends:»,precedes:«,trail:∘
set guioptions-=m
set guioptions-=T
set guioptions-=L
set guioptions-=l
set guioptions-=R
set guioptions-=r
set guioptions-=b
set guioptions-=h
set guioptions-=e

color gruvbox
set background=dark

hi Search guifg=white guibg=darkcyan gui=bold
hi Normal ctermfg=223 ctermbg=235 guifg=#eddbb2 guibg=#141414
hi WhiteOnRed ctermbg=red ctermfg=white guibg=red guifg=white
hi CursorLine term=reverse guibg=#1f1f1a
hi CursorColumn term=reverse guibg=#1f1f1a

let NERDTreeDirArrows=1
hi NERDTreeBookmarksLeader guifg=#83a598
