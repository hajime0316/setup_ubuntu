#!/bin/bash

set -e

sudo_knowing_password() {
    if ! ${password+:} false; then
        printf "[sudo] $USER のパスワード: "
        read -s password
    fi

    echo "$password" | sudo -S "$@"
}

SCRIPT_DIR=$(
    cd $(dirname $0)
    pwd
)

sudo_knowing_password apt update

curl https://packages.microsoft.com/keys/microsoft.asc | sudo apt-key add -
sudo_knowing_password sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/ms-teams stable main" > /etc/apt/sources.list.d/teams.list'

sudo_knowing_password apt update
sudo apt install teams -y
