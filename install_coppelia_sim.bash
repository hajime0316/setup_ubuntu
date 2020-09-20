#!/bin/bash

# -eオプションを有効
set -e

# V-REP本体のインストール
FILE_NAME_WITHOUT_EXTENSION="CoppeliaSim_Edu_V4_1_0_Ubuntu18_04"
LOCAL_COPPELIA_SIM_DIR="$HOME/CoppeliaSim"

# wget "https://coppeliarobotics.com/files/${FILE_NAME_WITHOUT_EXTENSION}.tar.xz"

# tar Jxvf "$FILE_NAME_WITHOUT_EXTENSION.tar.xz"
mv "$FILE_NAME_WITHOUT_EXTENSION" "$LOCAL_COPPELIA_SIM_DIR"
rm "$FILE_NAME_WITHOUT_EXTENSION.tar.xz"

# .bashrcにエイリアスを書く
echo "" >>~/.bashrc
echo "# CoppeliaSimを起動するエイリアス" >>~/.bashrc
echo "alias copsim='${LOCAL_COPPELIA_SIM_DIR}/coppeliaSim.sh'" >>~/.bashrc
