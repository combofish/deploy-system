#!/usr/bin/sh

# ln .vimrc ~/.vimrc
# ln .shrc ~/.shrc
# ln .zshrc ~/.zshrc

# ln -s emacs.d ~/.emacs.d

config_pre_i3(){
    deps=(conky xscreensaver feh shutter rofi konsole i3status i3blocks xcompmgr)
    sudo apt-get install ${deps[@]}
}

config_i3blocks(){
    mkdir ~/.config/i3blocks
}

config_i3(){
    if [ -f ~/.config/i3/config ]; then
        mv ~/.config/i3/config ~/.config/i3/config-$(date +"%m-%d-%Y").bak
    fi

    ln ./i3/config ~/.config/i3/config
}

config_urxvt(){
    # download
    # sudo apt-get install rxvt-unicode
    echo "config urxvt"

    if [ -f ~/.Xresources ]; then
        mv ~/.Xresources ~/.Xresources-$(date +"%m-%d-%Y").bak
    fi

    ln ./.Xresources ~/.Xresources
}

config_system(){
    # config_pre_i3
    # config_i3
    config_urxvt
}

config_system
