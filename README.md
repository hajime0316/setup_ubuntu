# Setup Ubuntu 18.04

Ubuntu 18.04で快適に開発するために必要なソフトウェアのインストールと設定を行うスクリプト．

## 使い方

### 共用PC

`setup_ubuntu1804_for_share_pc.bash`スクリプトを実行して，必要なソフトウェアのインストールと設定を行う．

```sh
./setup_ubuntu1804_for_share_pc.bash
```

### 個人用PC

`setup_ubuntu1804.bash`スクリプトを実行して，必要なソフトウェアのインストールと設定を行う．

```sh
./setup_ubuntu1804.bash
```

これだけでは以下のソフトウェアはインストールされない．

- ROS Melodic
- CoppeliaSim
- Dropbox

これらは個別にインストールスクリプトを動作させることでインストールできる．

```sh
./install_ros_melodic.bash
./install_coppelia_sim.bash
./install_dropbox.bash
```

### 開発用情報

本プロジェクトのbashスクリプトは，最初に以下の定形行を入れることとする．

```bash
#!/bin/bash

set -e

sudo_knowing_password() {
    if ! ${password+:} false; then
        printf "[sudo] $USER のパスワード: "
        read -s password
    fi

    echo "$password" | sudo -S "$@"
}

SCRIPT_DIR=$(
    cd $(dirname $0)
    pwd
)
```
