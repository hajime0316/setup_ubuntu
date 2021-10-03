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

curl "https://download.zotero.org/client/release/5.0.96.3/Zotero-5.0.96.3_linux-x86_64.tar.bz2" -O
tar -jxvf Zotero-5.0.96.3_linux-x86_64.tar.bz2
mv Zotero_linux-x86_64 /opt/zotero
/opt/zotero/set_launcher_icon
ln -s /opt/zotero/zotero.desktop ~/.local/share/applications/zotero.desktop
