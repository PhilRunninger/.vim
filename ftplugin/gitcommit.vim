set colorcolumn=72

augroup TicketIDToCommitMesage " Grab Ticket ID and start commit message.
    autocmd!
    autocmd BufReadPost COMMIT_EDITMSG execute "silent! normal! qzq/# On branch.\\{-}\\zs\\d\\{8,}\<CR>\"zy//e\<CR>gg:s/\\[#z\\] //\<CR>I[#z] \<ESC>:s/\\[#\\] //\<CR>"
augroup END
