#!/bin/bash

sudo_knowing_password() {
    if ! ${password+:} false; then
        printf "[sudo] $USER のパスワード: "
        read -s password
    fi

    echo "$password" | sudo -S "$@"
}

set -e

sudo_knowing_password apt update # 最初にsudoにパスワードを渡すために必要

wget -qO - https://packagecloud.io/AtomEditor/atom/gpgkey | sudo apt-key add -
sudo_knowing_password sh -c 'echo "deb [arch=amd64] https://packagecloud.io/AtomEditor/atom/any/ any main" > /etc/apt/sources.list.d/atom.list'
sudo_knowing_password apt update
sudo_knowing_password apt install atom -y

# 参考URL: https://flight-manual.atom.io/getting-started/sections/installing-atom/#platform-linux
