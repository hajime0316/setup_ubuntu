#!/bin/bash

set -e

# 関数定義
sudo_knowing_password() {
    if ! ${password+:} false; then
        printf "[sudo] $USER のパスワード: "
        read -s password
    fi

    echo "$password" | sudo -S "$@"
}

# terminatorのインストール
sudo_knowing_password apt update
sudo_knowing_password apt install -y terminator

# 設定のインポート
SCRIPT_DIR=$(
    cd $(dirname $0)
    pwd
)
if [ ! -d ~/.config/terminator ] ;then
    mkdir -p ~/.config/terminator
fi
cat "$SCRIPT_DIR/config_files/terminator.conf" >> ~/.config/terminator/config

# エイリアスの設定
echo '' >>~/.bashrc
echo '# terminator設定' >>~/.bashrc
echo 'alias rosterm="terminator -l ros & exit"' >>~/.bashrc
