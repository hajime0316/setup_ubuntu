#!/bin/bash

# pipを使ってvcstoolをインストールする．
# pipのインストールもこのスクリプトの中で行っている．

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
sudo_knowing_password apt install -y python-pip
sudo -H pip install vcstool

echo '# vcstoolのオートコンプリート設定' >> ~/.bashrc
echo 'source /usr/share/vcstool-completion/vcs.bash' >> ~/.bashrc
echo '' >> ~/.bashrc
