#!/bin/bash

sudo_knowing_password() {
    if ! ${password+:} false; then
        printf "[sudo] $USER のパスワード: "
        read -s password
    fi

    echo "$password" | sudo -S "$@"
}

set -e

# config_files/fontsからフォントファイルをコピーする
SCRIPT_DIR=$(
    cd $(dirname $0)
    pwd
)
mkdir -p ~/.fonts
cp -r ${SCRIPT_DIR}/config_files/fonts/* ~/.fonts
