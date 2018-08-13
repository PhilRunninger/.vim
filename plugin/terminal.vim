function! s:ExecuteOSCommand(keep_old_terminals, cmd)
    if !a:keep_old_terminals
        " the buffer name of terminal for this command, and list of windows containing it.
        let buffer_name = "!" . (a:cmd == '' ? &shell : a:cmd)
        let cmd_windows = filter(range(1, winnr('$')), 'bufname(winbufnr(v:val)) =~ "^' . buffer_name . '" && term_getstatus(winbufnr(v:val)) =~? "finished"')
        " Close all finished terminal windows that match the command to be run.
        while len(cmd_windows) > 0
            execute cmd_windows[0] 'wincmd c'
            let cmd_windows = filter(range(1, winnr('$')), 'bufname(winbufnr(v:val)) =~ "^' . buffer_name . '" && term_getstatus(winbufnr(v:val)) =~? "finished"')
        endwhile

        if term_getstatus(buffer_name) =~? 'running'
            " The terminal is still running. Switch to its window, or open a new split for it.
            let cmd_windows = filter(range(1, winnr('$')), 'bufname(winbufnr(v:val)) =~ "^' . buffer_name . '"')
            if len(cmd_windows) > 0
                execute cmd_windows[0] 'wincmd w'
            else
                split
                execute 'buffer ' . buffer_name
            endif
            return
        endif
    endif

    execute 'term ' . a:cmd
endfunction

command! -nargs=* -bang Do call s:ExecuteOSCommand(<bang>0, '<args>')

nnoremap <F9> :Do<space>
cnoremap <F9> <Up>
cnoremap <S-F9> <Down>
