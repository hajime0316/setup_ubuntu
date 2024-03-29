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
while IFS= read line; do
    if [ "${line}" = "function sysCall_info()" ]; then
        flag=true
    elif "${flag}"; then
        flag=false
        if [[ ! "${line}" =~ ^--.*$ ]]; then
            line="--${line}"
        fi
    fi

    echo "${line}" >>"${LOCAL_COPPELIA_SIM_DIR}/lua/b0RemoteApiServer.tmp"
done <"${LOCAL_COPPELIA_SIM_DIR}/lua/b0RemoteApiServer.lua"

mv "${LOCAL_COPPELIA_SIM_DIR}/lua/b0RemoteApiServer.lua" "${LOCAL_COPPELIA_SIM_DIR}/lua/b0RemoteApiServer.bak"
mv "${LOCAL_COPPELIA_SIM_DIR}/lua/b0RemoteApiServer.tmp" "${LOCAL_COPPELIA_SIM_DIR}/lua/b0RemoteApiServer.lua"

chmod a+x "${LOCAL_COPPELIA_SIM_DIR}/lua/b0RemoteApiServer.lua"
