nnoremap <F5> :w<CR>:Dispatch rebar -r eu skip_deps=true<CR>:copen<CR>/\(: \zs.*\*failed\*\\|All \d\+ tests passed\.\)<CR>G<C-W><C-P>
nnoremap <F6> :w<CR>:Dispatch rebar -r eu skip_deps=true suites=%:t:r<CR>:copen<CR>/\(: \zs.*\*failed\*\\|All \d\+ tests passed\.\)<CR>G<C-W><C-P>
