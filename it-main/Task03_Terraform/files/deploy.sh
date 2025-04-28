#!/bin/bash
set -e
APP_DIR=${1:-$HOME}
sudo mv /tmp/myapp.service /etc/systemd/system/myapp.service
sudo systemctl daemon-reload
sudo systemctl start myapp
sudo systemctl enable myapp
