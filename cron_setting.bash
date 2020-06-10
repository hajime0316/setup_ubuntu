#!/bin/bash

set -e

SCRIPT_DIR=$(
    cd $(dirname $0)
    pwd
)

crontab "$SCRIPT_DIR/config_files/cron.conf"
