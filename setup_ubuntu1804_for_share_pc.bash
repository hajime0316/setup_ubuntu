#!/bin/bash

set -e

if ! ${password+:} false; then
    printf "[sudo] $USER のパスワード: "
    read -s password
fi

# VS Codeのインストール
echo "[SETUP INFO] Start installing VS Code"
echo ""
source install_vscode.bash
echo "[SETUP INFO] Finish installing VS Code"
echo ""

# Atomのインストール
echo "[SETUP INFO] Start installing Atom"
echo ""
source install_atom.bash
echo "[SETUP INFO] Finish installing Atom"
echo ""

# SimpleScreenRecorderのインストール
echo "[SETUP INFO] Start installing SimpleScreenRecorder"
echo ""
source install_screen_recorder.bash
echo "[SETUP INFO] Finish installing SimpleScreenRecorder"
echo ""

# trashコマンドのインストール
# trashコマンドの導入
# 不要なファイルをコマンドラインからゴミ箱へ移動させる
echo "[SETUP INFO] Start installing trash command"
echo ""
source install_trash_command.bash
echo "[SETUP INFO] Finish installing trash command"
echo ""

# treeコマンドのインストール
# treeコマンドの導入
# ディレクトリ構造を図的に表示してくれる
echo "[SETUP INFO] Start installing tree command"
echo ""
source install_tree_command.bash
echo "[SETUP INFO] Finish installing tree command"
echo ""

# gitのインストール
echo "[SETUP INFO] Start installing git"
echo ""
source install_git.bash
echo "[SETUP INFO] Finish installing git"
echo ""

# vcstoolのインストール
# バージョン管理のソフトウェア
echo "[SETUP INFO] Start installing vcstool"
echo ""
source install_vcstool.bash
echo "[SETUP INFO] Finish installing vcstool"
echo ""

# プロンプトの設定
echo "[SETUP INFO] Start prompt setup"
echo ""
source prompt_show_git_status.bash
echo "[SETUP INFO] Finish prompt setup"
echo ""

# ctrl + alt + right/leftが今は無いはずの左右ワークスペース切り替えに設定されているため，これを解除
# 参考：https://docs.oracle.com/cd/E19683-01/817-0280/6mg3enmj4/index.html
echo "[SETUP INFO] Setup workspace switching key bindings"
echo ""
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-left "[]"
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-right "[]"
echo ""

# CapsキーをCtrlキーに変更
# 参考：https://linuxfan.info/capslock-ctrl
echo "[SETUP INFO] Change Caps key to Ctrl key"
gsettings set org.gnome.desktop.input-sources xkb-options "['ctrl:nocaps']"
echo ""

# 端末を起動するショートカットキーを「ctrl + T」に変更
echo "[SETUP INFO] Change key bindings for terminal"
echo ""
gsettings set org.gnome.settings-daemon.plugins.media-keys terminal "<Primary>t"
echo ""

# 電源管理の設定
echo "[SETUP INFO] Power management settings"
echo ""
# バッテリー駆動時は20分でサスペンド
gsettings set org.gnome.settings-daemon.plugins.power sleep-inactive-battery-type 'suspend'
gsettings set org.gnome.settings-daemon.plugins.power sleep-inactive-battery-timeout 1200
# 電源接続時はサスペンドしない
gsettings set org.gnome.settings-daemon.plugins.power sleep-inactive-ac-type 'nothing'
# ブランクスクリーンにしない
gsettings set org.gnome.desktop.session idle-delay 0
echo ""
