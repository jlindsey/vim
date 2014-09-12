My vim dotfiles and plugins, etc etc etc

Installation
------------
Uses Vundle which must be installed first (included as a submodule):

    git submodule update --init --recursive

Then you need to install the plugins in the bundle with:

    vim -c ':PluginInstall!'

A few of the plugins have additional manual installation steps:

* For **eregex.vim**: `cd ~/.vim/bundle/eregex.vim && make && make install`
* For **vimproc.vim**: `cd ~/.vim/bundle/vimproc.vim && make`

