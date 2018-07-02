function! ExecuteOSCommand(keep_old, cmd)
    if !a:keep_old
        let old_windows = filter(range(1, winnr('$')), 'bufname(winbufnr(v:val)) =~ "^!' . a:cmd . '"')
        while len(old_windows) > 0
            execute old_windows[0] 'wincmd c'
            let old_windows = filter(range(1, winnr('$')), 'bufname(winbufnr(v:val)) =~ "^!' . a:cmd . '"')
        endwhile
    endif
    execute 'term ' . a:cmd
endfunction

command! -nargs=+ -bang Do call ExecuteOSCommand(<bang>0, '<args>')

nnoremap <F9> :Do<space>
cnoremap <F9> <Up>
cnoremap <S-F9> <Down>
