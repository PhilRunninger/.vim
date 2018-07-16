function! ExecuteOSCommand(keep_old, cmd)
    " regex to look for exising buffer, and list of windows containing it.
    let buffer_name = "^!" . (a:cmd == '' ? &shell : a:cmd)
    let containing_windows = filter(range(1, winnr('$')), 'bufname(winbufnr(v:val)) =~ "' . buffer_name . '"')

    " If reusing/replacing an old terminal buffer with the same name...
    if !a:keep_old
        " Switch to the shell window. Don't close it, 'cuz it's still active.
        if a:cmd == '' && len(containing_windows) > 0
            execute containing_windows[0] 'wincmd w'
            return
        endif

        " Close each window that matches our command to be run.
        while len(containing_windows) > 0
            execute containing_windows[0] 'wincmd c'
            let containing_windows = filter(range(1, winnr('$')), 'bufname(winbufnr(v:val)) =~ "' . buffer_name . '"')
        endwhile
    endif

    " Start the command in a new terminal window.
    execute 'term ' . a:cmd
endfunction

command! -nargs=* -bang Do call ExecuteOSCommand(<bang>0, '<args>')

nnoremap <F9> :Do<space>
cnoremap <F9> <Up>
cnoremap <S-F9> <Down>
