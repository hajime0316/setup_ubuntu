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

# pintaのインストール
# ペイントソフト
echo "[SETUP INFO] Start installing pinta"
echo ""
source install_pinta.bash
echo "[SETUP INFO] Finish installing pinta"
echo ""

# trashコマンドのインストール
# trashコマンドの導入
# 不要なファイルをコマンドラインからゴミ箱へ移動させる
echo "[SETUP INFO] Start installing trash command"
echo ""
source install_trash_command.bash
echo "[SETUP INFO] Finish installing trash command"
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
prompt_show_git_status.bash
echo "[SETUP INFO] Finish prompt setup"
echo ""

# フォントの導入
echo "[SETUP INFO] Introduce fonts"
echo ""
introduce_fonts.bash

# ctrl + alt + right/leftが今は無いはずの左右ワークスペース切り替えに設定されているため，これを解除
# 参考：https://docs.oracle.com/cd/E19683-01/817-0280/6mg3enmj4/index.html
echo "[SETUP INFO] Setup workspace switching key bindings"
echo ""
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-left "[]"
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-right "[]"

# ホームフォルダ内のフォルダ名を英語に変更
# 再起動時にフォルダ名を日本語に戻すかどうか聞いてくるので，次回から「表示しない」
# にチェックを入れて「古い名前のままにする」をクリックする．
# 参考にしたサイト: https://qiita.com/taiko19xx/items/d1a001bfc25245b91354
echo "[SETUP INFO] Fix japanese dir name"
echo ""
# LANG=C xdg-user-dirs-gtk-update
