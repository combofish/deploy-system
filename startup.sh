#!/bin/sh
# author:combofish
# email:combofish49@gmail.com 
# Filename: startup.sh

pre_install(){
    echo "->>> pre install"

    sudo apt-get install emacs vim zsh rxvt-unicode 
}

config_editor(){

    echo "->>> config_editor"
    
    if [ -f ~/.vimrc ]; then
        mv ~/.vimrc ~/.vimrc-$(date +"%m-%d-%Y").bak
    fi

    if [ -d ~/.emacs.d/ ]; then
        mv ~/.emacs.d/ ~/.emacs.d-$(date +"%m-%d-%Y").bak
    fi

    ln .vimrc ~/.vimrc
    ln -s emacs.d ~/.emacs.d

}

config_zsh(){
    echo "->>> config_zsh"
    
    ln .shrc ~/.shrc
    ln .zshrc ~/.zshrc
    source ~/.zshrc
    chsh -s /bin/zsh

    git clone https://github.com/ohmyzsh/ohmyzsh ../ohmyzsh
    git clone https://github.com/zsh-users/zsh-autosuggestions ../ohmyzsh/zsh-autosuggestions
    
}

config_urxvt(){

    echo "->>> config_urxvt"

    if [ -f ~/.Xresources ]; then
        mv ~/.Xresources ~/.Xresources-$(date +"%m-%d-%Y").bak
    fi

    ln ./.Xresources ~/.Xresources
}

config_anaconda(){
    echo "->>> config_conda"
    
    if [ -f ~/.condarc ]; then
        mv ~/.condarc ~/.condarc-$(date +"%m-%d-%Y").bak
    fi
    
    ln ./.condarc ~/.condarc
    # echo ". /home/larry/anaconda3/etc/profile.d/conda.sh" >> ~/.zshrc    
}

config_system(){
    echo "->>> config system"

    pre_install 

    config_editor
    config_zsh
    config_urxvt
    config_anaconda

}

config_system
