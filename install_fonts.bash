#!/bin/bash

sudo_knowing_password(){
    # TODO: パスワード間違えたら終了する
    if ! ${password+:} false
    then
        printf "[sudo] $USER のパスワード: "
        read -s password
    fi

    echo "$password" | sudo -S $*
}

set -e

sudo_knowing_password apt install fonts-ricty-diminished
