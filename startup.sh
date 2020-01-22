#!/bin/sh
# author:combofish
# email:combofish49@gmail.com 
# Filename: startup.sh

ln .vimrc ~/.vimrc
ln -s emacs.d ~/.emacs.d

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
    sudo apt-get install rxvt-unicode
    echo "config urxvt"

    if [ -f ~/.Xresources ]; then
        mv ~/.Xresources ~/.Xresources-$(date +"%m-%d-%Y").bak
    fi

    ln ./.Xresources ~/.Xresources
}

config_anaconda(){
    ln ./.condarc ~/.condarc
    # echo ". /home/larry/anaconda3/etc/profile.d/conda.sh" >> ~/.zshrc    
}

# config_python3_8_install(){
#     sudo apt-get install python3.8
# }

config_go_language(){
    sudo apt-get install golang
}

# # this func mov to ./script/combo file.
# config_python_envs(){
#     # conda create -n test-py36 python=3.6
#     conda activate test-py36
#     conda install tensorflow=1.15 pillow
# }

config_zsh(){
    ln .shrc ~/.shrc
    ln .zshrc ~/.zshrc
    git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH}/zsh-autosuggestions
    chsh -s /bin/zsh
}

# software: useful tools
config_tools(){
    # ccat
    go get -u github.com/jingweno/ccat
    echo $(ccat -V)
}

config_system(){
    ## env var set in .shrc. Make sure its right.
    cd $DOTFILES
    echo "config system"

    ## i3 desktop manager
    # config_pre_i3
    # config_i3blocks
    # config_i3

    ## install and config software
    # config_urxvt
    # config_anaconda
    # config_go_language
    config_zsh

    ## prepare usefull tools
    # config_tools
}

config_system
