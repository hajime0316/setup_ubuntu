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

sudo_knowing_password add-apt-repository ppa:maarten-baert/simplescreenrecorder
sudo_knowing_password apt update
sudo_knowing_password apt install -y simplescreenrecorder

# MP3コーデックの取得
# sudo_knowing_password apt install -y ubuntu-restricted-extras

# 参考URL
# http://pineplanter.moo.jp/non-it-salaryman/2018/02/25/simplescreenrecorder/
# https://linuxfan.info/play-media-files-on-ubuntu
