# Vimrc Options Quick Lookup

Keeping track of what settings do what in your vimrc is difficult without cluttering it up with comments. Fortunately, vim has an `:options` command to view all available vimrc settings and an explanation of what they do. This plugin opens the `:options` menu and does a search of the setting under the cursor.

### Usage

From inside your vimrc, put the cursor over any setting and use `:OptionOpen` or shortcut `K`.

This will open the options menu in a vertical split and find the setting for quick reference.

### Installation

I use [Vundle](https://github.com/gmarik/Vundle.vim) to manage plugins but to do it manually:

    git clone https://github.com/scottperlitch/vim-options.git
    $ cp vim-options/ftplugin/vim-options.vim ~/.vim/ftplugin/
    $ cp vim-options/doc/vim-options.txt ~/.vim/doc/
