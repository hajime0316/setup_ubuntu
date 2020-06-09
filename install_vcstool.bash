#!/bin/bash

set -e

# 関数定義
sudo_knowing_password() {
    if ! ${password+:} false; then
        printf "[sudo] $USER のパスワード: "
        read -s password
    fi

    echo "$password" | sudo -S $*
}

sudo_knowing_password sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'
sudo_knowing_password apt-key adv --keyserver hkp://pool.sks-keyservers.net --recv-key 0xAB17C654
sudo_knowing_password apt update
sudo_knowing_password apt install python3-vcstool
