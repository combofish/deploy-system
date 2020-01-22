# author:combofish
# email:combofish49@gmail.com 
# Filename: softwares_pre_install.sh

# install softwares that use frequency.
config_software(){
    softwares=(golang python3.8 thunar arduino okular ranger htop glances whowatch lua5.3 rustc) # golang ruby python java g++ gcc
    sudo apt-get install ${softwares[@]}
    
}
