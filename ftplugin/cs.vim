set errorformat=\ %#%f(%l\\\,%c):\ %m
set makeprg=msbuild\ /nologo\ /v:q\ /property:GenerateFullPaths=true

nnoremap <F5> :make run<CR>
nnoremap <F6> :make<CR>:copen<CR>
