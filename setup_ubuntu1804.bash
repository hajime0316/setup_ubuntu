#!/bin/bash

set -e

if ! ${password+:} false; then
    printf "[sudo] $USER のパスワード: "
    read -s password
fi

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

# terminatorのインストール
echo "[SETUP INFO] Start installing terminator"
echo ""
source install_terminator.bash
echo "[SETUP INFO] Finish installing terminator"
echo ""

# SimpleScreenRecorderのインストール
echo "[SETUP INFO] Start installing SimpleScreenRecorder"
echo ""
source install_screen_recorder.bash
echo "[SETUP INFO] Finish installing SimpleScreenRecorder"
echo ""

# bleachbitのインストール
echo "[SETUP INFO] Start installing bleachbit"
echo ""
source install_bleachbit.bash
echo "[SETUP INFO] Finish installing bleachbit"
echo ""

# gnuplotのインストール
echo "[SETUP INFO] Start installing gnuplot"
echo ""
source install_gnuplot.bash
echo "[SETUP INFO] Finish installing gnuplot"

# Google Chromeのインストール
# 色々便利なブラウザ
echo "[SETUP INFO] Start installing google-chrome"
echo ""
source install_google_chrome.bash
echo "[SETUP INFO] Finish installing google-chrome"
echo ""

# kolourpaintのインストール
# ペイントツール
echo "[SETUP INFO] Start installing kolourpaint"
echo ""
source install_kolourpaint.bash
echo "[SETUP INFO] Finish installing kolourpaint"
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

# python3のインストール
echo "[SETUP INFO] Start installing python3"
echo ""
source install_python3.bash
echo "[SETUP INFO] Finish installing python3"
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

# plotjuggerのインストール
echo "[SETUP INFO] Start installing plotjuggler"
echo ""
source install_plotjuggler.bash
echo "[SETUP INFO] Finish installing plotjuggler"
echo ""

# プロンプトの設定
echo "[SETUP INFO] Start prompt setup"
echo ""
source prompt_show_git_status.bash
echo "[SETUP INFO] Finish prompt setup"
echo ""

# フォントの導入
echo "[SETUP INFO] Start installing fonts"
echo ""
source install_fonts.bash
echo "[SETUP INFO] Finish installing fonts"
echo ""

# crontabの設定
# 自動で実行するスクリプトをcronに設定する
echo "[SETUP INFO] Start cron setting"
echo ""
./cron_setting.bash
echo "[SETUP INFO] Finish cron setting"
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

# ファイルを開くopenコマンドの定義
echo "[SETUP INFO] Define open command"
echo ""
echo "# ファイルを開くopenコマンドの定義" >>~/.bashrc
echo "alias open=xdg-open" >>~/.bashrc
echo "" >>~/.bashrc
echo ""

# 端末を起動するショートカットキーを「ctrl + T」に変更
echo "[SETUP INFO] Change key bindings for terminal"
echo ""
gsettings set org.gnome.settings-daemon.plugins.media-keys terminal "<Primary>t"
echo ""

# ホームフォルダ内のフォルダ名を英語に変更
# 再起動時にフォルダ名を日本語に戻すかどうか聞いてくるので，次回から「表示しない」
# にチェックを入れて「古い名前のままにする」をクリックする．
# 参考にしたサイト: https://qiita.com/taiko19xx/items/d1a001bfc25245b91354
echo "[SETUP INFO] Fix japanese dir name"
echo ""
LANG=C xdg-user-dirs-gtk-update
echo ""
