#!/bin/sh
# author:combofish
# email:combofish49@gmail.com 
# Filename: startup.sh

update_sources(){
    release_name=`uname -n`
    
    if test $release_name = 'raspberrypi' ; then
	echo "->>> for $release_name add Qinghua sources"
	
	if [ -f /etc/apt/sources.list ]; then
            mv /etc/apt/sources.list /etc/apt/sources.list-$(date +"%m-%d-%Y").bak
	fi

	if [ -f /etc/apt/sources.list.d/raspi.list ]; then
            mv /etc/apt/sources.list.d/raspi.list /etc/apt/sources.list.d/raspi.list-$(date +"%m-%d-%Y").bak
	fi

	# 编辑 `/etc/apt/sources.list` 文件，删除原文件所有内容，用以下内容取代：
	echo "deb http://mirrors.tuna.tsinghua.edu.cn/raspbian/raspbian/ buster main non-free contrib" > /etc/apt/sources.list
	echo "deb-src http://mirrors.tuna.tsinghua.edu.cn/raspbian/raspbian/ buster main non-free contrib" >> /etc/apt/sources.list

	# 编辑 `/etc/apt/sources.list.d/raspi.list` 文件，删除原文件所有内容，用以下内容取代：
	echo "deb http://mirrors.tuna.tsinghua.edu.cn/raspberrypi/ buster main ui" > /etc/apt/sources.list.d/raspi.list
    fi

    unset release_name

}

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
        mv ~/.emacs.d ~/.emacs.d-$(date +"%m-%d-%Y").bak
    fi

    ln .vimrc ~/.vimrc
    ln -s emacs.d ~/.emacs.d

}

config_zsh(){
    echo "->>> config_zsh"

    if [ -f ~/.shrc ]; then
        mv ~/.shrc ~/.shrc-$(date +"%m-%d-%Y").bak
    fi

    if [ -f ~/.zshrc ]; then
        mv ~/.zshrc ~/.zshrc-$(date +"%m-%d-%Y").bak
    fi

    ln .shrc ~/.shrc
    ln .zshrc ~/.zshrc
    # source ~/.zshrc
    echo "->>> Enter your passwd: "
    chsh -s /bin/zsh

    git clone https://github.com/ohmyzsh/ohmyzsh ../ohmyzsh
    git clone https://github.com/zsh-users/zsh-autosuggestions ../ohmyzsh/plugins/zsh-autosuggestions
    
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

    update_sources
    pre_install 

    config_editor
    config_zsh
    config_urxvt
    config_anaconda

}

config_system
