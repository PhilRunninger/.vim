# My Vim Setup

## Installation

These instructions assume you will be running them from a bash shell. First, clone the repository into your home directory. On Windows, use the folder name `vimfiles`; on all other OSes, use the folder name `.vim`.

```
$ cd ~
$ git clone git@github.com:PhilRunninger/my_vim_setup.git vimfiles
$ vim
```
__or__

```
$ cd ~
$ git clone git@github.com:PhilRunninger/my_vim_setup.git .vim
$ vim
```

The rest of the setup takes place in vim. Ignore the error messages when it first starts. They will go away after you run this command.

```
:PlugInstall
```

That should do it. Close and reopen vim to see that there are no longer any messages on startup.

## Customized vimrc Processing

This setup is designed for my primary development environment on a MacBook. Using this setup in another OS, or with different available colors, will most likely produce undesirable side effects. To alleviate this behavior, a post processing step can be added. This is done with a separate file - **post_vimrc** in the same folder as vimrc - that is sourced by vimrc at the end of its processing. In this file, you can change settings for the particular environment.

### Example

Here is the post_vimrc I use on my Windows environment, which has fewer color and font options, and gitgutter (for now, at least) is not working correctly.

```
" vim: filetype=vim

let g:gitgutter_enabled = 0

if !has("gui_win32")

  colorscheme SlateDark
  let g:statusline_insert='cterm=none ctermfg=15 ctermbg=4'     " White on Dark Blue
  let g:statusline_modified='cterm=none ctermfg=15 ctermbg=1'   " White on Dark Red
  let g:statusline_unmodified='cterm=none ctermfg=15 ctermbg=2' " White on Dark Green

  highlight WildMenu cterm=none ctermfg=0  ctermbg=3 " Black on Dark Yellow
  highlight User1    cterm=none ctermfg=11 ctermbg=2 " Yellow on Dark Green
  highlight User2    cterm=none ctermfg=11 ctermbg=1 " Yellow on Dark Red
  highlight User3    cterm=none ctermfg=11 ctermbg=4 " Yellow on Dark Blue
  highlight User4    cterm=none ctermfg=0  ctermbg=0 " Black on Black

  let g:NERDTreeIndicatorMapCustom = {
      \ "Modified"  : "M",
      \ "Staged"    : "S",
      \ "Untracked" : "?",
      \ "Renamed"   : "R",
      \ "Unmerged"  : "U",
      \ "Deleted"   : "D",
      \ "Dirty"     : "d",
      \ "Clean"     : "c",
      \ "Unknown"   : "u"
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
Normal / Selection | `gs`                    | Open scratch buffer in its window                                                                  | `:h Scratch`
Normal / Selection | `gS`                    | Open an empty scratch buffer in its window                                                         |
Normal             | `gcc` or `gc[motion]`   | Comment or uncomment line(s) of code                                                               | `:h commentary.txt`
Selection          | `gc`                    | Command or uncomment selected line(s) of code                                                      |
Normal             | `ys[text object][char]` | Surround text obect with char and its matching character, ie. ', ", \`, ( and ), { and }, [ and ], or < and >. | `:h surround`
Normal             | `cs[oldchar][newchar]`  | Change surrounding characters from old to new                                                      |
Normal             | `ds[char]`              | Remove closest specified surrounding characters                                                    |

#### Additional Mappings Defined in vimrc

Mode | Keystroke | Function | For more help...
---|---|---|---
Visual | `Enter`     | Start **EasyAlign** plugin                           | `:h easyalign`
Normal | `F3`        | Perform git grep on word under cursor                | `:h fugitive`
Visual | `F3`        | Perform git grep on visual selection                 |
Insert | `Tab`       | Highlight next item in autocomplete popup            | `:h neocomplcache`
Insert | `Shift+Tab` | Highlight previous item in autocomplete popup        |
Normal | `<leader>u` | Toggle **UndoTree** window                           | `:h undotree.txt`
Normal | `<leader>b` | Toggle **BufExplorer** window                        | `:h bufexplorer`
Normal | `<leader>n` | Toggle **NERDTree** window                           | `:h NERDTree`
Normal | `<leader>f` | Open **NERDTree** window, focused on current buffer  |
Normal | `<leader>t` | Toggle the **Tagbar** window                         | `:h tagbar`
Insert / Selection | `Ctrl+K` | Choose snippet or jump to next field in it  | `:h neosnippet`

### Windowing and Movement

To create windows (splits), I use these Vim commands:

* `Ctrl+W`, `s` to split the current window horizontally
* `Ctrl+W`, `v` to split the current window vertically

Mode | Mapping | Function | Replaces This Vim Command
---|---|---|---
Normal | `Tab`         | Move to next window          | `Ctrl+W`, `W`
Normal | `Ctrl+j`      | Move to next window below    | `Ctrl+W`, `j`
Normal | `Ctrl+k`      | Move to next window above    | `Ctrl+W`, `k`
Normal | `Ctrl+h`      | Move to next window at left  | `Ctrl+W`, `h`
Normal | `Ctrl+l`      | Move to next window at right | `Ctrl+W`, `l`
Normal | `Shift+Up`    | Resize window taller         | `:resize +5<Enter>`
Normal | `Shift+Down`  | Resize window shorter        | `:resize -5<Enter>`
Normal | `Shift+Right` | Resize window wider          | `:vertical resize +10<Enter>`
Normal | `Shift+Left`  | Resize window narrower       | `:vertical resize -10<Enter>`

### Miscellaneous

Mode | Mapping | Function
---|---|---
Normal | `<leader>cd`       | Change vim's current working directory to match the current buffer's
Normal | `<leader>d<space>` | Remove trailing spaces, pending confirmation of each instance
Normal | `<>`               | Convert Erlang list string under cursor to binary string
Normal | `><`               | Convert Erlang binary string under cursor to list string
Normal | `-`                | Toggle cursorline (highlight, or not, the current line)
Normal | `|`                | Toggle cursorcolumn (highlight, or not, the current column)
Normal | `+`                | Toggle display of line/column indicators
Visual | `~`                | Toggle visual selection between lowercase, Title Case, and UPPERCASE
Normal | `Ctrl+n`           | Toggle relativenumber on and off.
Normal / Insert / Visual | `Up`, `Down`, `Left`, `Right`, `Page Up` or `Page Down` | No operation (to break bad keyboard habits)
Insert | `jk`               | Same as pressing Escape, only easier to reach
Normal | `#`                | Switch to previous buffer in current window
