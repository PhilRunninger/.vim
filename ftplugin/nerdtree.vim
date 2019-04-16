" Filename:  ~/.vim/ftplugin/nerdtree.vim
" Purpose: Given a Visual-Line selection in the NERDTree buffer, this code
" lets you open all selected files with the same key mappings, which, by
" default, are:
"   o - open files in previous window
"   i - open files in horizontally split windows
"   s - open files in vertically split windows
"   t - open files in new tabs

execute "vnoremap <buffer> " . g:NERDTreeMapActivateNode . " :call <SID>OpenMultiple('p')<CR>"
execute "vnoremap <buffer> " . g:NERDTreeMapOpenSplit . " :call <SID>OpenMultiple('h')<CR>"
execute "vnoremap <buffer> " . g:NERDTreeMapOpenVSplit . " :call <SID>OpenMultiple('v')<CR>"
execute "vnoremap <buffer> " . g:NERDTreeMapOpenInTab . " :call <SID>OpenMultiple('t')<CR>"

function! s:OpenMultiple(target) range
    let curLine = a:firstline
    while curLine <= a:lastline
        call cursor(curLine, 1)
        let node = g:NERDTreeFileNode.GetSelected()
        call nerdtree#echo("Opening " . (curLine - a:firstline + 1) . " of " . (a:lastline - a:firstline + 1) . "...")
        if !empty(node) && !node.path.isDirectory
            call node.open({'where':a:target, 'stay':1, 'keepopen':1})
        endif

        let curLine += 1
    endwhile
    if g:NERDTreeQuitOnOpen
        NERDTreeClose
    endif
    call nerdtree#echo("")
endfunction
