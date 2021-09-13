#!/bin/bash

# -eオプションを有効
set -e

# 関数定義
sudo_knowing_password() {
    if ! ${password+:} false; then
        printf "[sudo] $USER のパスワード: "
        read -s password
    fi

    echo "$password" | sudo -S "$@"
}

# curlのインストール
sudo_knowing_password apt update
sudo_knowing_password apt install -y curl

# CoppeliaSim本体のインストール
FILE_NAME_WITHOUT_EXTENSION="CoppeliaSim_Edu_V4_2_0_Ubuntu18_04"
LOCAL_COPPELIA_SIM_DIR="$HOME/CoppeliaSim"

curl "https://coppeliarobotics.com/files/${FILE_NAME_WITHOUT_EXTENSION}.tar.xz" -O
# wget "https://coppeliarobotics.com/files/${FILE_NAME_WITHOUT_EXTENSION}.tar.xz"

tar Jxvf "$FILE_NAME_WITHOUT_EXTENSION.tar.xz"
mv "$FILE_NAME_WITHOUT_EXTENSION" "$LOCAL_COPPELIA_SIM_DIR"
rm "$FILE_NAME_WITHOUT_EXTENSION.tar.xz"

# .bashrcにエイリアスを書く
echo "# CoppeliaSimを起動するエイリアス" >>~/.bashrc
echo "alias copsim='${LOCAL_COPPELIA_SIM_DIR}/coppeliaSim.sh'" >>~/.bashrc
echo "" >>~/.bashrc

# CoppeliaSim側におけるB0 Remote APIの有効化
# b0RemoteApiServerのAddOnを起動時に自動でロードするようにする
# (remove the sysCall_info function in lua/b0RemoteApiServer.lua)
# https://www.coppeliarobotics.com/helpFiles/en/b0RemoteApiServerSide.htm
flag=false
while read line; do
    if [ "${line}" = "function sysCall_info()" ]; then
        flag=true
        echo 1
    elif "${flag}"; then
        flag=false
        line="--     return {autoStart=false}"
        echo 2
    fi

    echo "${line}" >>test.lua
done <"${LOCAL_COPPELIA_SIM_DIR}/lua/b0RemoteApiServer.lua"
