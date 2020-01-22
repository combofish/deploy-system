#!/usr/bin/zsh
# author: combofish
# email: combofish49@gmail.com
# description: shell script for config system.

config_python_envs(){
    # conda create -n test-py36 python=3.6

    # exec next line fail
    # conda activate test-py36

    conda install tensorflow=1.15 pillow
}

config_python_envs_cv(){
    # conda create -n test-py36-cv python=3.6
    # conda activate test-py36-cv
    conda install opencv
}

config_setup_ros(){
    # 
    # sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'
    # sudo apt-key adv --keyserver 'hkp://keyserver.ubuntu.com:80' --recv-key C1CF6E31E6BADE8868B172B4F42ED6FBAB17C654
    # sudo apt updatesudo apt-key adv --keyserver 'hkp://keyserver.ubuntu.com:80' --recv-key C1CF6E31E6BADE8868B172B4F42ED6FBAB17C654
    sudo apt update
    sudo apt install ros-melodic-desktop-full
    sudo rosdep init
    rosdep update
    
    # echo "source /opt/ros/melodic/setup.zsh" >> ~/.zshrc
    # source ~/.zshrc
    sudo apt install python-rosinstall python-rosinstall-generator python-wstool build-essential
}

config_setup_ros_workspace(){
    mkdir -p ~/workspace/catkin_ws/src
    cd ~/workspace/catkin_ws/
    catkin_make
}

config_ros_pcl_openni(){
    sudo apt-get install ros-melodic-openni-launch
}

config_ros_pcl(){
    cd ~/workspace/catkin_ws/src/
    catkin_create_pkg my_pcl_tutorial pcl_conversions pcl_ros roscpp sensor_msgs
}

config_qtcreator(){
    sudo apt-get update
    sudo apt-get install qtcreator
}

# 安装python 模块
config_python_modules(){
    echo "install python module"
    # /usr/bin/pip install --upgrade pip --user larry
    # /usr/bin/pip install pdfminer		

}

# install softwares that use frequency.
config_software(){
    softwares=(thunar arduino okular ranger htop glances whowatch lua5.3 rustc) # golang ruby python java g++ gcc
    sudo apt-get install ${softwares[@]}
    
}

script(){
    echo ">>> script..."
    ## python env. no use.
    # config_python_envs
    # config_python_envs_cv

    ## ROS 
    # config_setup_ros_workspace
    # config_ros_pcl_openni
    # config_ros_pcl

    # config_qtcreator
    config_python_modules

    config_software
}

script
