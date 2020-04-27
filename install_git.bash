#!/bin/bash

sudo_knowing_password(){
    if ! ${password+:} false
    then
        printf "[sudo] $USER のパスワード: "
        read -s password
    fi

    echo "$password" | sudo -S $*
}

set -e

sudo_knowing_password apt update
sudo_knowing_password apt install git

# エディターにvscodeを使う
git config --global core.editor "code --wait"

# merge時のコミットオブジェクト作成に関する設定
## mergeの時に必ずコミットオブジェクトを作成する
git config --global merge.ff false
## pullにおけるmergeの時はコミットオブジェクトを作成しない
git config --global pull.ff only

# 不要になったリモート追跡ブランチを自動で削除
git config --global fetch.prune true

# .gitignore_globalの設定
git config --global core.excludesfile ~/.gitignore_global

echo "*~" >> ~/.gitignore_global
echo ".vscode/" >> ~/.gitignore_global
echo ".catkin_tools/" >> ~/.gitignore_global

# エイリアス設定
git config --global alias.st "status -s"
git config --global alias.graph "log --oneline --graph"

# 日本語ファイル名が数字で表示される問題への対応 (Windows)
git config --global core.quotepath off
