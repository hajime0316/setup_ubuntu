#!/bin/bash

sudo_knowing_password() {
    if ! ${password+:} false; then
        printf "[sudo] $USER のパスワード: "
        read -s password
    fi

    echo "$password" | sudo -S $*
}

set -e

sudo_knowing_password add-apt-repository ppa:webupd8team/atom
sudo_knowing_password apt update
sudo_knowing_password apt install -y atom
