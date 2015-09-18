# Vim Cheatsheet

## Custom Mappings

### Plugin Mappings

These are additional mappings written to access plugin functionality. It does not include mappings defined by these plugins.

Mode   | Mapping          | Function | For more help...
---+---+---+---+---
Normal | <leader>b        | Toggle **BufExplorer** in current window | :h bufexplorer
Normal | <leader>vb       | Split window vertically and show **BufExplorer** |
Normal | <leader>hb       | Split window horizontaly and show **BufExplorer** |
Visual | Enter            | Start **EasyAlign** plugin | :h easyalign
Normal | F3               | Perform git grep on word under cursor | :h fugitive
Visual | F3               | Perform git grep on visual selection |
Insert | Tab              | Select from autocomplete popup | :h neocomplcache
Insert | S-Tab            | Select from autocomplete popup |
Normal | <leader>t        | Toggle **NERDTree** window | :h NERDTree
Normal | <leader>u        | Toggle **UndoTree** window | :h undotree.txt

### Windowing and Movement

Mode   | Mapping     | Function               | Vim Command Replaced
---+---+---+---
Normal | Ctrl+J      | Switch window down     | Ctrl+W, J
Normal | Ctrl+K      | Switch window up       | Ctrl+W, K
Normal | Ctrl+H      | Switch window left     | Ctrl+W, H
Normal | Ctrl+L      | Switch window right    | Ctrl+W, L
Normal | Shift+Up    | Resize window taller   | :resize +5<CR>
Normal | Shift+Down  | Resize window shorter  | :resize -5<CR>
Normal | Shift+Right | Resize window wider    | :vertical resize +10<CR>
Normal | Shift+Left  | Resize window narrower | :vertical resize -10<CR>

### Miscellaneous

Mode   | Mapping          | Function
---+---+---+---
Normal | <leader>cd       | Change cwd to match current buffer's
Normal | <leader>d<space> | Remove trailing spaces
Normal | <>               | Convert Erlang list string under cursor to binary string
Normal | ><               | Convert Erlang binary string under cursor to list string
Normal | +                | Toggle display of line/column indicators
