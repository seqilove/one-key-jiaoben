#!/bin/bash
apt update
apt install -y libappindicator1 libdbusmenu-glib4 libdbusmenu-gtk4 libindicator7 libpango1.0 gdebi-core
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
gdebi -n google-chrome-stable_current_amd64.deb

# run by command
# google-chrome-stable
# or
# google-chrome-stable --no-sandbox
