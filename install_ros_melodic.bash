#!/bin/bash

# 関数定義
sudo_knowing_password(){
    if ! ${password+:} false
    then
        printf "[sudo] $USER のパスワード: "
        read -s password
    fi

    echo "$password" | sudo -S $*
}

# -eオプションを有効
# エラーが出た場合はそこで止まる
set -e

# パッケージのアップデート
sudo_knowing_password apt update

# パッケージのアップグレード
sudo_knowing_password apt upgrade -y

# sources.listの設定
echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" | sudo tee /etc/apt/sources.list.d/ros-latest.list

# 鍵の設定
sudo_knowing_password apt-key adv --keyserver 'hkp://keyserver.ubuntu.com:80' --recv-key C1CF6E31E6BADE8868B172B4F42ED6FBAB17C654

# パッケージリストの更新
sudo_knowing_password apt update

# ROS本体のインストール
sudo_knowing_password apt install ros-melodic-desktop-full -y

# rosdepをインストール
sudo_knowing_password apt install python-rosdep

# rosdepの初期化
sudo_knowing_password rosdep init
rosdep update

# rosinstallの準備
sudo_knowing_password apt install python-rosinstall -y

# catkin buildの準備
sudo_knowing_password apt install python-catkin-tools -y

# 環境のセットアップ
echo "" >> ~/.bashrc
echo "# ROS 環境のセットアップ" >> ~/.bashrc
echo "source /opt/ros/melodic/setup.bash" >> ~/.bashrc

# catkin_init_workspaceコマンドをcatkin tools用に書き換える
echo "" >> ~/.bashrc
echo "# catkin tools初期化" >> ~/.bashrc
echo 'alias catkin_init_workspace="catkin build && catkin config --cmake-args -DCMAKE_BUILD_TYPE=Debug -DCMAKE_EXPORT_COMPILE_COMMANDS=ON"' >> ~/.bashrc

# スクリプト作るうえで参考にしたサイト
# https://keens.github.io/blog/2015/06/17/shell_scriptwokakutokinikiwotsuketaikoto/
# https://hacknote.jp/archives/31390/
# https://karaas.hatenablog.jp/entry/2018/12/13/131535
# https://qiita.com/wnoguchi/items/2fc3ec11043d139dc6bb
