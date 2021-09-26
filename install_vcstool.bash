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

    echo "$password" | sudo -S "$@"
}

sudo_knowing_password apt update
sudo_knowing_password apt install -y python-pip
sudo_knowing_password -H pip install vcstool

echo '# vcstoolの入力補完を有効化' >> ~/.bashrc
echo 'source /usr/local/share/vcstool-completion/vcs.bash' >> ~/.bashrc
echo '' >> ~/.bashrc
