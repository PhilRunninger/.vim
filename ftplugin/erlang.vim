" Tab settings
set softtabstop=4   " number of spaces that <tab> uses when editing
set tabstop=4       " number of spaces that <tab> in file uses
set shiftwidth=4    " number of spaces to use for (auto)indent step
set expandtab       " use spaces when <tab> is inserted

" Convert Erlang "list strings" to <<"binary strings">>, and back again.
nnoremap <> m`f"a>><ESC>,,i<<<ESC>``ll
nnoremap >< m`f"lxx,,XX``hh

nnoremap <F5> :w<CR>:Dispatch rebar -r eu skip_deps=true<CR>:copen<CR>/\(: \zs.*\*failed\*\\|All \d\+ tests passed\.\)<CR>G<C-W><C-P>
nnoremap <F6> :w<CR>:Dispatch rebar -r eu skip_deps=true suites=%:t:r<CR>:copen<CR>/\(: \zs.*\*failed\*\\|All \d\+ tests passed\.\)<CR>G<C-W><C-P>
nnoremap <F7> :w<CR>:Dispatch rebar -r ct skip_deps=true<CR>:copen<CR>

" This function improves Vim's navigation to tags. The default behavior of ^-]
" doesn't account for the colon separator between module and function. So we
" just redefine it. Man, I love vim!
" Credit goes to: jmuc @ https://stackoverflow.com/a/19778777/510067
function! ErlangTag()
    let isk_orig = &isk
    set isk+=:
    let keyword = expand('<cword>')
    let &isk = isk_orig
    let parts = split(keyword, ':')
    if len(parts) == 1
        execute 'tag' parts[0]
    elseif len(parts) == 2
        let [mod, fun] = parts
        let i = 1
        let fun_taglist = taglist('^' . fun . '$')
        for item in fun_taglist
           if item.kind == 'f' && item.module == mod
               silent execute i . 'tag' fnameescape(item.name)
               break
           endif
           let i += 1
        endfor
    endif
endfunction

nnoremap <buffer> <c-]>    :call ErlangTag()<cr>
