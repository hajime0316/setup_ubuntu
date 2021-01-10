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

# VS Codeのインストール
# 参考にしたサイト: https://qiita.com/yoshiyasu1111/items/e21a77ed68b52cb5f7c8
sudo_knowing_password apt update
sudo_knowing_password apt install -y curl
curl -L https://go.microsoft.com/fwlink/?LinkID=760868 -o vscode.deb
sudo_knowing_password apt install ./vscode.deb
rm vscode.deb
