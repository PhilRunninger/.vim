" Vim syntax file
" Language: Erlang files
" Maintainer: Phil Runninger

set conceallevel=1

" Hide the -spec lines, since they're visually distracting when looking at code.
syntax region erlangSpec start="^-spec" end='\.\s*\(".*\)\?$' containedin=ALL conceal cchar=-
