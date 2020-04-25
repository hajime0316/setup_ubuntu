#!/bin/bash

# git-promptの導入
wget https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh -O ~/.git-prompt.sh
chmod a+x ~/.git-prompt.sh

# .bashrcの書き換え
echo "" >> ~/.bashrc
echo "# プロンプトの設定" >> ~/.bashrc
echo "" >> ~/.bashrc
echo "source ~/.git-prompt.sh     # プロンプトにgitのステータスを表示させる" >> ~/.bashrc
echo "" >> ~/.bashrc
echo "GIT_PS1_SHOWDIRTYSTATE=ON        # git-promptの設定" >> ~/.bashrc
echo "GIT_PS1_SHOWUPSTREAM=ON          # プロンプトに各種情報を表示" >> ~/.bashrc
echo "GIT_PS1_SHOWUNTRACKEDFILES=ON    #" >> ~/.bashrc
echo "GIT_PS1_SHOWSTASHSTATE=ON        #" >> ~/.bashrc
echo "" >> ~/.bashrc
echo "PS1='\e]0;\u@\h: \w\a\n\[\033[1;32m\]\u\[\033[00m\] \[\033[1;34m\]\w\[\033[1;33m\]\$(__git_ps1)\[\033[00m\]\n\$ '" >> ~/.bashrc

# 参考
# https://qiita.com/jun68ykt/items/d95010ad7dae2f802474
# https://qiita.com/varmil/items/9b0aeafa85975474e9b6
# https://qiita.com/katsukii/items/da37d1fdf974bd0e4c2f
# https://okmount.hatenablog.com/entry/20090601/p1
