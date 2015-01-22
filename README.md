dotfiles
========

I am using MacVim from homebrew:

    brew install macvim

For some plugins we need this to be installed:

    cabal install ghc-mod

MacVim uses this font:

    https://github.com/Lokaltog/powerline-fonts/tree/master/Inconsolata

Get the repository
    
    git clone <this repo>
    cd <path to the cloned repo>
    git submodule update --init --recursive
    cd vim/bundle/YouCompleteMe
    ./install.sh
    cd ../vimproc.vim/
    make

Then we need to make some symlinks:

    ln -s $PWD/ghci.conf ~/.ghc/ghci.conf

    ln -s $PWD/vimrc ~/.vimrc
    ln -s $PWD/gvimrc ~/.gvimrc
    ln -s $PWD/vim ~/.vim

    ln -s $PWD/gitconfig ~/.gitconfig
