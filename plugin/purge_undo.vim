function! PurgeUndo()
    enew
    call execute ("r! ls " . &undodir, "silent")
    execute "1delete"
    call execute("%s/^\\(.*\\)/\\1|\\1/", "silent")
    while search('%.*|', 'w') > 0
        call execute("%s/%\\ze.*|/\\//", "silent")
        let n = line('$')
        while n > 0
            let file = split(getline(n), '|')
            if filereadable(file[0])
                execute n."delete"
            endif
            let n = n - 1
        endwhile
    endwhile

    if line('$') > 0 && getline(1) > ""
        call execute ("%s/^.*|//", "silent")

        let n = line('$')
        while n > 0
            call delete(&undodir . getline(n))
            let n = n - 1
        endwhile

        echomsg "PurgeUndo() finshed."
        echomsg "These undo files were deleted because the original files no longer exist."
    else
        execute "bwipeout! " . bufnr('%')
        echomsg "PurgeUndo() finshed."
        echomsg "No superfluous undo files were found."
    endif
endfunction
