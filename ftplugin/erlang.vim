" Convert Erlang "list strings" to <<"binary strings">>, and back again.
nnoremap <> m`f"a>><ESC>,,i<<<ESC>``ll
nnoremap >< m`f"lxx,,XX``hh

nnoremap <F5> :w<CR>:Dispatch rebar -r eu skip_deps=true<CR>:copen<CR>/\(: \zs.*\*failed\*\\|All \d\+ tests passed\.\)<CR>G<C-W><C-P>
nnoremap <F6> :w<CR>:Dispatch rebar -r eu skip_deps=true suites=%:t:r<CR>:copen<CR>/\(: \zs.*\*failed\*\\|All \d\+ tests passed\.\)<CR>G<C-W><C-P>
nnoremap <F7> :w<CR>:Dispatch rebar -r ct skip_deps=true<CR>:copen<CR>
