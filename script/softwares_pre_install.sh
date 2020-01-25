# author:combofish
# email:combofish49@gmail.com 
# Filename: softwares_pre_install.sh

# install softwares that use frequency.
config_software(){
    softwares=(golang python3.8 thunar arduino okular ranger htop glances whowatch lua5.3 rustc) # golang ruby python java g++ gcc
    sudo apt-get install ${softwares[@]}
    
}

config_software_kvm(){
    sudo apt-get -y install qemu-kvm qemu virt-manager virt-viewer libvirt-daemon-system libvirt-clients
}

config_software_kvm
sudo systemctl start libvirtd
sudo systemctl enable libvirtd
