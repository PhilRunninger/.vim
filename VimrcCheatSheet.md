# Vim Cheatsheet

**Important Note:** *Make sure you type commands as you see them in rendered form. Do not type Markup's escape characters (backtick, in particular) when issuing the commands.*
 
## Custom Mappings

The `<leader>` key is used to expand the number of possible key mappings. By default it is the backslash key, but many Vimmers, including me, have it redefined as the spacebar. It's always within reach, and normally has no useful function anyway.

Mappings of more than one character must be fully typed within a short timeout period; otherwise, they will be considered as separate keystrokes. For example, `<leader>b` typed too slowly, would move your cursor one character to the right, and then back one word.

### Plugin Mappings

These are additional mappings written to enhance plugin functionality. The table does not include mappings defined by these plugins.

Mode   | Keystroke     | Function                                          | For more help...
---|---|---|---
Normal | `<leader>b`   | Toggle **BufExplorer** in current window          | `:h bufexplorer`
Normal | `<leader>vb`  | Split window vertically and show **BufExplorer**  |
Normal | `<leader>hb`  | Split window horizontaly and show **BufExplorer** |
Visual | `Enter`       | Start **EasyAlign** plugin                        | `:h easyalign`
Normal | `F3`          | Perform git grep on word under cursor             | `:h fugitive`
Visual | `F3`          | Perform git grep on visual selection              |
Insert | `Tab`         | Highlight next item in autocomplete popup         | `:h neocomplcache`
Insert | `Shift+Tab`   | Highlight previous item in autocomplete popup     |
Normal | `<leader>t`   | Toggle **NERDTree** window                        | `:h NERDTree`
Normal | `<leader>u`   | Toggle **UndoTree** window                        | `:h undotree.txt`

### Windowing and Movement

To create windows (splits), I use these Vim commands:

* `Ctrl+W`, `S` to split the current window horizontally
* `Ctrl+W`, `V` to split the current window vertically

Mode   | Mapping       | Function                     | Replaces This Vim Command
---|---|---|---
Normal | `Ctrl+J`      | Move to next window below    | `Ctrl+W`, `J`
Normal | `Ctrl+K`      | Move to next window above    | `Ctrl+W`, `K`
Normal | `Ctrl+H`      | Move to next window at left  | `Ctrl+W`, `H`
Normal | `Ctrl+L`      | Move to next window at right | `Ctrl+W`, `L`
Normal | `Shift+Up`    | Resize window taller         | `:resize +5<Enter>`
Normal | `Shift+Down`  | Resize window shorter  | `:resize -5<Enter>`
Normal | `Shift+Right` | Resize window wider    | `:vertical resize +10<Enter>`
Normal | `Shift+Left`  | Resize window narrower | `:vertical resize -10<Enter>`

### Miscellaneous

Mode   | Mapping            | Function
---|---|---
Normal | `<leader>cd`       | Change vim's current working directory to match the current buffer's
Normal | `<leader>d<space>` | Remove trailing spaces
Normal | `<>`               | Convert Erlang list string under cursor to binary string
Normal | `><`               | Convert Erlang binary string under cursor to list string
Normal | `+`                | Toggle display of line/column indicators
