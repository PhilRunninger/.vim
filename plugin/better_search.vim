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
        try
            execute 'normal! n'
        catch
            echohl Error
            echo v:exception
            echohl None
        endtry
    endif
endfunction

function! s:ClearSearchString()
    let s:words = []
    call s:CreateSearchString()
endfunction

nnoremap <silent> * :call <SID>ToggleWord()<CR>
nnoremap <silent> <leader>* :call <SID>ClearSearchString()<CR>

vnoremap <silent> * :<C-U>
  \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
  \gvy/<C-R><C-R>=substitute(
  \escape(@", '/\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
  \gV:call setreg('"', old_reg, old_regtype)<CR>
nnoremap <silent> <leader>/ :vimgrep "<C-R>/" %<CR>n:copen<CR>
vnoremap <silent> <leader>/ y:vimgrep "<C-R>0" %<CR>/<C-R>0<CR>:copen<CR>
