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

sudo_knowing_password apt update
sudo_knowing_password apt install python3-pip -y
pip3 install atcoder-tools

# atcoder-workspaceフォルダを作成
ATCODER_WORKSPACE_DIR=~/atcoder-workspace
mkdir -p "${ATCODER_WORKSPACE_DIR}"
mkdir -p "${ATCODER_WORKSPACE_DIR}/.vscode"

# 設定ファイルを移動
cp "${SCRIPT_DIR}/config_files/atcodertools/.atcodertools.toml" ~
cp "${SCRIPT_DIR}/config_files/atcodertools/my_template.cpp" "${ATCODER_WORKSPACE_DIR}"
cp -r "${SCRIPT_DIR}/config_files/atcodertools/ac-library" "${ATCODER_WORKSPACE_DIR}"
cp "${SCRIPT_DIR}/config_files/atcodertools"/*.json "${ATCODER_WORKSPACE_DIR}/.vscode"
