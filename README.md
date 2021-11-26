# fff.vim

A plugin for vim/neovim which allows you to use [**`fff`**](https://github.com/dylanaraps/fff) as a file opener.

## Table of Contents

<!-- vim-markdown-toc GFM -->

* [Installation](#installation)
* [Usage](#usage)
    * [Command](#command)
    * [Easy hotkey](#easy-hotkey)
* [Customization](#customization)
    * [Split Size](#split-size)
    * [Split Direction](#split-direction)

<!-- vim-markdown-toc -->

## Installation

Using [vim-plug](https://github.com/junegunn/vim-plug):

```vim
Plug 'dylanaraps/fff.vim'
```

Then run `:PlugUpdate`

## Usage

### Command

```vim
" Open in Vim's current working directory.
:F

" Open in ~/dotfiles (or other path)
:F ~/dotfiles
```

### Easy hotkey

```vim
" Open fff on press of Leader then 'f', where Leader is '\' by default
nnoremap <silent> <Leader>f :F<CR>
```

## Customization

### Split Size

Default: `let g:fff#split = "10new"`

```vim
" Vertical split (NERDtree style).
let g:fff#split = "30vnew"
```

### Split Direction

Default: `let g:fff#split_direction = "splitbelow splitright"`

```vim
" Open split on the left side (NERDtree style).
let g:fff#split_direction = "nosplitbelow nosplitright"
```
