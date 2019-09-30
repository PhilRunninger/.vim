let s:words = []

function! s:ToggleWord()
    let l:word = '\<' . expand("<cword>") . '\>'
    let l:i = index(s:words, l:word)
    if l:i >= 0
        call remove(s:words, l:i)
    else
        call add(s:words, l:word)
    endif
    echomsg string(s:words)
    call s:CreateSearchString()
endfunction

function! s:CreateSearchString()
    if empty(s:words)
        let @/ = ''
    else
        let @/ = '\(' . join(s:words,'\|') . '\)'
    endif
endfunction

function! s:ClearSearchString()
    let s:words = []
    call s:CreateSearchString()
endfunction

nnoremap <silent> * :call <SID>ToggleWord()<CR>n
nnoremap <silent> <leader>* :call <SID>ClearSearchString()<CR>
