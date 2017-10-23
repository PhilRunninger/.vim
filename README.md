# My Vim Setup

## Installation

These instructions assume you will be running them from a bash shell. First, clone the repository into your home directory. On Windows, use the folder name `vimfiles`; on all other OSes, use the folder name `.vim`.

__Windows__

```
$ git clone git@github.com:PhilRunninger/my_vim_setup.git ~/vimfiles
$ vim
```
__Mac or Linux__

```
$ git clone git@github.com:PhilRunninger/my_vim_setup.git ~/.vim
$ vim
```

The rest of the setup takes place in vim. Ignore the error messages when it first starts. They will go away when you restart vim after running this command.

```
:PlugInstall
```

## Customized vimrc Processing

This setup is designed for my primary development environment on a MacBook. Using this setup in another OS, or with different available colors, will most likely produce undesirable side effects. To alleviate this behavior, a post processing step can be added. This is done with a separate file - **post_vimrc** in the same folder as vimrc - that is sourced by vimrc at the end of its processing. In this file, you can change settings for the particular environment.

### Example

Here is the post_vimrc I use on my Windows environment, which fewer color and font options.

```
" vim: filetype=vim

let NERDTreeDirArrowExpandable = '►'
let NERDTreeDirArrowCollapsible = '▼'

let g:buftabline_separators = 0

nnoremap <leader>r :redraw!<CR>

if has("gui_win32")
  set guifont=Consolas:h12:w6
else
  colorscheme SlateDark
  let g:statusline_insert='cterm=none ctermfg=15 ctermbg=1'     " White on Blue
  let g:statusline_modified='cterm=none ctermfg=15 ctermbg=4'   " White on Red
  let g:statusline_unmodified='cterm=none ctermfg=15 ctermbg=2' " White on Green

  highlight WildMenu cterm=none ctermfg=0 ctermbg=3 " Black on Yellow
  highlight User1    cterm=none ctermfg=7 ctermbg=1 " White on Blue
  highlight User2    cterm=none ctermfg=7 ctermbg=4 " White on Red

  let g:NERDTreeIndicatorMapCustom = {
      \ "Modified"  : "¤",
      \ "Staged"    : "+",
      \ "Untracked" : "*",
      \ "Renamed"   : "►",
      \ "Unmerged"  : "=",
      \ "Deleted"   : "X",
      \ "Dirty"     : "x",
      \ "Clean"     : "º",
      \ "Unknown"   : "?"
      \ }
endif
```

## Custom Key Mappings

**Important Note:** *Make sure you type commands as you see them in rendered form. Do not type Markup's escape characters (backtick, in particular) when issuing the commands.*

The `<leader>` key is used to increase the number of possible key mappings. By default, it is the backslash key, but many Vimmers, including me, have it redefined as the spacebar, which is always within reach, and normally has no useful function anyway.

Mappings of more than one character must be fully typed within a short timeout period; otherwise, they will be considered as separate keystrokes. For example, `<leader>b` typed too slowly, would move your cursor one character to the right, and then back one word.

### Plugin Mappings

#### Useful Mappings Defined by Plugins

Mode | Keystroke | Function | For more help...
---|---|---|---
Normal<br>Selection | `gs`                    | Open scratch buffer in its own window                                                              | `:h Scratch`
Normal<br>Selection | `gS`                    | Open an empty scratch buffer in its own window                                                     |
Normal              | `gcc` or `gc[motion]`   | Comment or uncomment line(s) of code                                                               | `:h commentary.txt`
Selection           | `gc`                    | Command or uncomment selected line(s) of code                                                      |
Normal              | `ys[text object][char]` | Surround text obect with char and its matching character, ie. ', ", \`, ( and ), { and }, [ and ], or < and >. | `:h surround`
Visual              | `S`                     | Surround selection with char and its matching character, ie. ', ", \`, ( and ), { and }, [ and ], or < and >. |
Normal              | `cs[oldchar][newchar]`  | Change surrounding characters from old to new                                                      |
Normal              | `ds[char]`              | Remove closest specified surrounding characters                                                    |

#### Additional Mappings Defined in vimrc

Mode | Keystroke | Function | For more help...
---|---|---|---
Visual | `Enter`     | Start **EasyAlign** plugin                           | `:h easyalign`
Normal | `F3`        | Perform git grep on word under cursor                | `:h fugitive`
Visual | `F3`        | Perform git grep on visual selection                 |
Insert | `Tab`       | Highlight next item in autocomplete popup            | `:h neocomplcache`
Insert | `Shift+Tab` | Highlight previous item in autocomplete popup        |
Normal | `<leader>u` | Toggle **UndoTree** window                           | `:h undotree.txt`
Normal | `<leader>o` | Open the **Vifm** window to select file(s) to open   | `:h vifm-:EditVifm`
Insert<br>Selection | `Ctrl+o` | Choose snippet or jump to next field in it  | `:h neosnippet`

### Window Movement

Mode | Mapping | Function
---|---|---
Normal | `<leader>w` | Go to next window - `<C-W>w`
Normal | `<leader>W` | Go to previous window - `<C-W>W`
Normal | `Up` | Resize 5 rows taller - `5<C-W>+`
Normal | `Down` | Resize 5 rows shorter - `5<C-W>-`
Normal | `Left` | Resize 10 columns narrower - `10<C-W><`
Normal | `Right` | Resize 10 columns wider - `10<C-W>>`
Normal | `<leader>x` | Maximize current window - <code>\<C-W>&#124;\<C-W>_</code>
Normal | `<leader>=` | Equalize all window sizes - `<C-W>=`

### Buffer Commands

Mode | Mapping | Function
---|---|---
Normal | `#`                 | Toggle between two most recently used buffers, eg. [`A` ⇄ `B` `C`]
Normal | `<leader>p`         | Switch to previous buffer in the buffer list, eg. [ ← `A` ← `B` ← `C` ← ]
Normal | `<leader>n`         | Switch to next buffer in the buffer list, eg. [ → `A` → `B` → `C` → ]
Normal | `<leader>b`         | Toggle BufExplorer. See `:h bufexplorer`.

### Searching for Text

Mode | Mapping | Function
---|---|---
Visual | `*`                 | Search forward for selected text
Normal | `n`                 | Search forward, and center match on screen - `nzzzv`
Normal | `N`                 | Search backward, and center match on screen - `Nzzzv`
Normal | `<leader><Space>`   | Hide search result highlighting. See `:h :nohlsearch`
Normal | `<leader>/`         | Show current file's matches in Quickfix window
Visual | `<leader>/`         | Search for selection, and show matches in Quickfix window

### Miscellaneous

Mode | Mapping | Function
---|---|---
Normal | `<leader>cd`        | Change vim's current working directory to match the current buffer's
Normal | `<leader>d<space>`  | Remove trailing spaces, pending confirmation of each instance
Normal | `<>`                | Convert Erlang list string under cursor to binary string
Normal | `><`                | Convert Erlang binary string under cursor to list string
Normal | `-`                 | Toggle cursorline (highlight, or not, the current line)
Normal | <code>&#124;</code> | Toggle cursorcolumn (highlight, or not, the current column)
Normal | `+`                 | Toggle both cursorline and cursorcolumn
Visual | `~`                 | Toggle visual selection between lowercase, Title Case, and UPPERCASE
