#!/bin/bash

sudo_knowing_password() {
    if ! ${password+:} false; then
        printf "[sudo] $USER のパスワード: "
        read -s password
    fi

    echo "$password" | sudo -S $*
}

set -e

sudo_knowing_password apt update
# TODO: ricty-diminishedは以下のGitHubから取得するようにする
# https://github.com/edihbrandon/RictyDiminished
# 理由：aptからインストールしたricty-diminishedはバッククオートの表示に不具合がある
sudo_knowing_password apt install -y fonts-ricty-diminished
sudo_knowing_password apt install -y fonts-migmix
