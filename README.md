# fff.vim

A plugin for vim/neovim which allows you to use `fff` as a file opener.

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
Plug 'dylanaraps/fff'
```

Then run `:PlugUpdate`

## Usage

### Command

```vim
" Open in current directory.
:F

" Open in ~/dotfiles (or other path)
:F ~/dotfiles
```

### Easy hotkey

```vim
" Open fff on press of 'f'
nnoremap f :F<CR>
```

## Customization

### Split Size

Default: `let g:fff#split = "10new"`

### Split Direction

Default: `let g:fff#split_direction = "splitbelow splitright"`
