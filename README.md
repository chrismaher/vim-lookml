# vim-lookml

This plugin offers simple improvements for editing [LookML](https://docs.looker.com/reference) files via the following functionality:
* Syntax highlighting
* Tag navigation
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

### Tags
In order to use the plugin's tag functionality, you must have ctags installed. If you're using macOS, you can use brew:

    brew install ctags

You'll also need to add LookML rules to your `~/.ctags` file:

    --langdef=lookml
    --langmap=lookml:.lkml
    --regex-lookml=/(dimension|measure): ([a-z0-9_]+) {/\2/

To generate a tags file, use the command `:LookMLTag`. The tag file will be placed at the base of your Looker project, as determined by the location of the .git directory.
