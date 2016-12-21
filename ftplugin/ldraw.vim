let s:current_line=0
let s:current_description=""
setlocal statusline=%f%=%{GetPartDescription()}

function! UpdatePartDescription()
    if !exists("g:ldraw_parts_list")
        echoerr "Define g:ldraw_parts_list, the full path to LDraw's parts.lst, in your vimrc."
        return
    endif

    if s:current_line == line('.')
        return
    endif
    let s:current_line=line('.')

    " Get dat file at end of line in model file.
    let s:dat_file = matchstr(getbufline('%', s:current_line)[0], '\w\+\.dat$')
    if s:dat_file == ""
        let s:current_description=""
        return
    endif

    " Get description from parts.lst file. How to do this without switching buffers?
    if bufnr('parts.lst') == -1
        execute "edit ".g:ldraw_parts_list
        execute "setlocal buftype=nowrite readonly"
    else
        execute "buffer parts.lst"
    endif
    let s:line_num = search('^'.s:dat_file.'\s*', 'w')
    if s:line_num != 0
        let s:current_description=matchstr(getbufline('%', s:line_num)[0], '^'.s:dat_file.'\s*\zs.*$')
    endif
    execute "buffer #"
endfunction

function! GetPartDescription()
    return s:current_description
endfunction

augroup LDraw
    autocmd!
    autocmd CursorMoved *.ldr,*.mpd call UpdatePartDescription()
    autocmd BufLeave *.ldr,*.mpd let b:winview = winsaveview()
    autocmd BufEnter *.ldr,*.mpd if(exists('b:winview')) | call winrestview(b:winview) | endif
augroup END
