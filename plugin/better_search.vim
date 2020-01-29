let s:words = []
let s:savedPattern = @/

function! s:ToggleWord()
    if s:words == []
        let s:savedPattern = @/
    endif

    let l:word = '\<' . expand("<cword>") . '\>'
    let l:i = index(s:words, l:word)
    if l:i >= 0
        call remove(s:words, l:i)
    else
        call add(s:words, l:word)
    endif
    call s:CreateSearchString()
endfunction

function! s:CreateSearchString()
    if empty(s:words)
        let @/ = s:savedPattern
        highlight Search term=reverse cterm=reverse ctermfg=214 ctermbg=235 gui=reverse guifg=#fabd2f guibg=#282828
    else
        let @/ = '\(' . join(s:words,'\|') . '\)'
        highlight Search term=reverse cterm=reverse ctermfg=208 ctermbg=235 gui=reverse guifg=#fabd2f guibg=#282828
        execute 'normal! n'
    endif
endfunction

function! s:ClearSearchString()
    let s:words = []
    call s:CreateSearchString()
endfunction

nnoremap <silent> * :call <SID>ToggleWord()<CR>
nnoremap <silent> <leader>* :call <SID>ClearSearchString()<CR>
