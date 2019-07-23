# My Vim Setup

## Installation
### of vim...
I've moved away from Homebrew for building my vim. Instead I've taken the bold move of building it from the source code. Here are the steps I followed to get the features I want/need.

```bash
git clone git@github.com/vim/vim.git
cd vim
git checkout master  # or other branch/tag
git pull
./configure --with-lua-prefix=/usr/local/Cellar/lua/5.3.5_1 --enable-luainterp --disable-gui --enable-pythoninterp=yes --with-features=huge
make
sudo make install
```

### of this repo...
First, clone the repository into your home directory, and then update its submodules. On Windows, use the folder name `vimfiles`; on all other OSes, use `.vim`, the default.

#### Windows

```bash
git clone git@github.com:PhilRunninger/.vim.git ~/vimfiles
cd vimfiles
git submodule update --init
```
#### Mac or Linux

```bash
git clone git@github.com:PhilRunninger/.vim.git
cd .vim
git submodule update --init
```

## Customized Post-Processing

This setup is designed for my primary development environment on a MacBook. Using this setup in different environments may require additional steps or different setting values. To facilitate this, use the `~/.vim/after/plugin` folder. Just add a VimScript file there, and it will be executed after the `vimrc` file is finished being sourced. In that file, you can change settings for the particular environment.

### Example

Here is the file I use on my Windows environment, which has only 16 colors and a font with fewer fancy characters.

```vim
" vim: filetype=vim

let NERDTreeDirArrowExpandable = '►'
let NERDTreeDirArrowCollapsible = '▼'

function! Map_ff()
    return &ff
endfunction

function! Map_ro_mod()
    return (&modifiable ? (&readonly ? "ro" : "") : "RO") . (&modified ? "+" : "")
endfunction

if has("gui_win32")
  set guifont=Consolas:h12:w6
else
  colorscheme SlateDark

  highlight WildMenu    cterm=none ctermfg=0 ctermbg=3   " Black on Yellow
  highlight GitBranch   cterm=none ctermfg=7 ctermbg=1   " White on Blue
  highlight Insert      cterm=none ctermfg=15 ctermbg=1  " White on Blue
  highlight NormalMod   cterm=none ctermfg=15 ctermbg=4  " White on Red
  highlight NormalNoMod cterm=none ctermfg=15 ctermbg=2  " White on Green
endif
```

## My Favorite Plugins

I change my vimrc way more often than is reasonable. As a result, it's hard to keep my key mappings' descriptions, formerly published here, up to date. In its place, I'm just going to list my favorite plugins and reasons why I like them.

### [NERDTree](https://github.com/scrooloose/nerdtree)<br/>[nerdtree-buffer-ops](https://github.com/PhilRunninger/nerdtree-buffer-ops.git)<br/>[nerdtree-visual-selection](https://github.com/PhilRunninger/nerdtree-visual-selection.git)
NERDTree is a tree explorer, useful for displaying your project tree in a side window. My mind grasps the tree paradigm better than others like fuzzy finders. In the spirit of full disclosure, I'm one of the collaborators of that project.

The others are plugins for a plugin. *(Can you say "recursion"?)* One of `nerdtree-buffer-ops`' two capabilities lets you close an open buffer from its location in the NERDTree window. The other changes the color of a file in the NERDTree window if it's open in the vim session.

`nerdtree-visual-selection` lets you create a visual selection inside NERDTree, then delete the selected files from the disk, or open them in Vim (in the previous window, in split windows, or in separate tabs).

### [Fugitive](https://github.com/tpope/vim-fugitive)
This is one that I don't use to its fullest extent. It's a very powerful in-Vim interface to Git commands. The commands I find most helpful are `:Gdiff` and `:Gblame` (usually to find out **when** a change occurred, not **who** did it.) When the mood strikes, I'll also use `:Gstatus` to review, stage, and commit changes.

### [](https://github.com/w0rp/ale.git)
### [GitGutter](https://github.com/airblade/vim-gitgutter)
This shows where I have uncommitted changes in a file. It also provides key mappings for navigating them: `]c` and `[c` to name a couple.

### [Commentary](https://github.com/tpope/vim-commentary.git)
Comment or uncomment several lines of code at once. It is smart enough to know the syntax of the language.

### [](https://github.com/diepm/vim-rest-console.git)
### [BufSelect](https://github.com/PhilRunninger/bufselect.vim.git)
Lists open buffers so that you can select one to close, or to open in the current, or new split, window.

### [](https://github.com/guns/xterm-color-table.vim)
### [](https://github.com/morhetz/gruvbox.git)
### [](https://github.com/sotte/presenting.vim.git)
### [NeoComplete](https://github.com/Shougo/neocomplete.vim)
A much-improved version of Vim's autocompletion.

### [UndoTree](https://github.com/mbbill/undotree)
This plugin displays a visual history of the changes made to the active buffer. Most interestingly, it shows how Vim manages these changes as a tree, rather than the expected stack.

### [Easy-Align](https://github.com/junegunn/vim-easy-align)
I use this plugin to line up columns of text, useful for tables of data or lines of similar code.

### [Scratch](https://github.com/mtth/scratch.vim)
Need a place to jot a thought down? Put it in a scratch buffer.

### [Vim-Sessions](https://github.com/PhilRunninger/vim-sessions.git)
This plugin allows you to leave a `.session.vim` file in a folder, so that when you restart vim, you can pick up where you left off. On startup, the plugin looks for a `.session.vim` file in the current folder or anywhere up the hierarchy, and asks whether or not to use it.

### [](https://github.com/kshenoy/vim-signature)
### [](https://github.com/tpope/vim-repeat)
### [Vim-Surround](https://github.com/tpope/vim-surround)
This is a great plugin for surrounding text with delimiters: `"` `'` `[ ]` `( )` `{ }` `< >` or HTML tags.

### [](https://github.com/tpope/vim-unimpaired)
### [](https://github.com/tommcdo/vim-exchange.git)
### [](https://github.com/chrisbra/Recover.vim.git)
### [](https://github.com/lfv89/vim-interestingwords.git)
### [](https://github.com/tpope/vim-markdown)
### [](https://github.com/elzr/vim-json)
### [](https://github.com/vim-scripts/NSIS-syntax-highlighting)
### [](https://github.com/chrisbra/csv.vim)
### [](https://github.com/tpope/vim-jdaddy)

### [Matrix screensaver](https://github.com/uguu-org/vim-matrix-screensaver.git)<br/>[Sokoban](https://github.com/PhilRunninger/sokoban.vim.git)<br/>[Rogue](https://github.com/katono/rogue.vim.git)
The occasional distractions from the dreary day-to-day work. Someday, I may try getting the Matrix screensaver to work faster.

Sokoban is an old [Sega Genesis game](https://segaretro.org/Shove_It!_...The_Warehouse_Game) I had. The protagonist's goal was to earn enough money pushing boxes to their designated spots in the warehouse, so he could buy a fancy red car to impress a girl. My fork sadly has no such backstory, but I believe it's a lot nicer than the fork from which it came.

Playing Rogue was how I spent A LOT of my time in the college computer lab. Yes, I had no life.
