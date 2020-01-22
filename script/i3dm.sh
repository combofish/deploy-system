#!/usr/bin/zsh
# author:combofish
# email:combofish49@gmail.com 
# Filename: i3dm.sh

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

config_i3dm(){
    echo "config i3"

    ## i3 desktop manager
    config_pre_i3
    config_i3blocks
    config_i3
}

config_i3dm
