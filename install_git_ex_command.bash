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

USER_BIN_DIR=~/bin

mkdir -p ~/bin
cp ${SCRIPT_DIR}/config_files/git_ex_command/git-* ${USER_BIN_DIR}
