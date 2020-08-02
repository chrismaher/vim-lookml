# vim-lookml

This plugin offers simple improvements for editing [LookML](https://docs.looker.com/reference) files via the following functionality:
* Syntax highlighting
* Code folding
* Section navigation
* Smarter indentation

See [usage](#usage) for more details.

## Installation
**[Vim-Plug](https://github.com/tpope/vim-pathogen)**
Add the following to `~/.vimrc`:

    Plug 'chrismaher/vim-lookml'

Call `PlugInstall vim-lookml`.

**[Pathogen](https://github.com/tpope/vim-pathogen)**

    git clone https://github.com/chrismaher/vim-lookml.git ~/.vim/bundle/vim-lookml

**[Vundle](https://github.com/VundleVim/Vundle.vim)**
Add the following to `~/.vimrc`:

    Plugin 'chrismaher/vim-lookml'

Call `:PluginInstall`.

## Usage

### Folding
By default, vim-lookml uses `setlocal foldlevel=1` so that the topmost foldlevel is open for new buffers. This can be overridden using the `g:lookml_foldlevel` variable.

### Sections
`[[` and `]]` are mapped to jump between field definitions in view files, and `join` definitions in model files.

`[]` and `][` are mapped to jump between `explore` and `view` definitions.
