if !exists("g:ldraw_parts_list")
    echoerr "Define g:ldraw_parts_list, the full path to LDraw's parts.lst, in your vimrc."
    finish
endif

let s:prev_line_visited=0
let s:prev_part_file=""
let s:part_description=""
setlocal statusline=%{GetPartDescription()}%=%f

function! s:UpdatePartDescription()

    if s:prev_line_visited == line('.')
        return
    endif
    let s:prev_line_visited=line('.')

    " Get part file at end of line in model file.
    let s:part_file = matchstr(getbufline('%', s:prev_line_visited)[0], '\w\+\.dat$')
    if s:part_file == ""
        let s:part_description=""
        return
    elseif s:part_file == s:prev_part_file
        return
    endif

    " Get description from parts.lst file. How to do this without switching buffers?
    if bufnr('parts.lst') == -1
        execute "edit ".g:ldraw_parts_list
        execute "setlocal buftype=nowrite readonly"
    else
        execute "buffer parts.lst"
    endif
    let s:line_num = search('^'.s:part_file.'\s*', 'w')
    if s:line_num == 0
        let s:part_description=s:part_file." not found"
    else
        let s:part_description=matchstr(getbufline('%', s:line_num)[0], '^'.s:part_file.'\s*\zs.*$')
    endif
    execute "buffer #"
endfunction

function! GetPartDescription()
    return s:part_description
endfunction

augroup LDraw
    autocmd!
    autocmd CursorMoved *.ldr,*.mpd call s:UpdatePartDescription()
augroup END
