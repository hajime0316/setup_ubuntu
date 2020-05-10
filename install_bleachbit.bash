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
sudo_knowing_password apt install -y bleachbit
sudo_knowing_password apt install -y libcanberra-gtk-module

# 設定の自動インポート
SCRIPT_DIR=$(
    cd $(dirname $0)
    pwd
)
if [ ! -d ~/.config/bleachbit ]; then
    mkdir -p ~/.config/bleachbit
fi
cat "$SCRIPT_DIR/config_files/bleachbit.conf" >> ~/.config/bleachbit/bleachbit.ini
