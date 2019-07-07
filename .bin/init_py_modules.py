#!/usr/bin/env sh

modules_list=(numpy scipy pandas scikit-learn tornado)

function install_pkg()
{
    echo "Install: $1"
    pip install $1 --user $USER
    echo "Install $1 done."
    return 0
    
}

for module in "${modules_list[@]}"
do
    install_pkg $module
done

