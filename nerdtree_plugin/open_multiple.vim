augroup NERDTreeOpenMultiple
    autocmd!
    autocmd BufNew NERD_tree_* vnoremap <buffer> o :call <SID>OpenMultiple()<CR>
augroup END

function! s:OpenMultiple() range
    let curLine = a:firstline
    while curLine <= a:lastline
        call cursor(curLine, 1)
        let node = g:NERDTreeFileNode.GetSelected()
        if !empty(node) && !node.path.isDirectory
            if curLine == a:firstline
                "open the first one in the previous window
                call node.open({'where':'p', 'stay':1, 'keepopen':1})
            else
                call node.open({'where':'h', 'stay':1, 'keepopen':1})
            endif
        endif

        let curLine += 1
    endwhile
    if g:NERDTreeQuitOnOpen
        NERDTreeClose
    endif
endfunction
