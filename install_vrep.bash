#!/bin/bash

# -eオプションを有効
set -e

# V-REP本体のインストール
FILE_NAME_WITHOUT_EXTENSION="V-REP_PRO_EDU_V3_6_2_Ubuntu18_04"

wget "https://coppeliarobotics.com/files/${FILE_NAME_WITHOUT_EXTENSION}.tar.xz"

tar Jxvf "$FILE_NAME_WITHOUT_EXTENSION.tar.xz"
mv "$FILE_NAME_WITHOUT_EXTENSION" ~/V-REP
rm "$FILE_NAME_WITHOUT_EXTENSION.tar.xz"

# .profileにパスの設定を書く
echo "" >> ~/.profile
echo "# V-REPへのパス" >> ~/.profile
echo 'PATH="$HOME/V-REP:$PATH"' >> ~/.profile
