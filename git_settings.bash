#!/bin/bash

# 変数定義
readonly USER_NAME="Hajime"
readonly USER_EMAIL="hajime0316@s.okayama-u.ac.jp"

# user name
git config --global user.name $USER_NAME

# user email
git config --global user.email $USER_EMAIL

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
