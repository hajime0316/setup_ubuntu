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

sudo_knowing_password apt update
sudo_knowing_password apt install -y trash-cli
