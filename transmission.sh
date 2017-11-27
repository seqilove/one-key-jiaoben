#!/bin/bash

TRANSPORT=9091
TRANSUSR='xiaofd'
TRANSPASS='xiaofd.win'

apt update
apt install -y transmission-daemon transmission-remote-cli
service transmission-daemon stop

cp /var/lib/transmission-daemon/info/settings.json ~
cd /var/lib/transmission-daemon/info/
cp settings.json settings.json.old

sed 's/"rpc-authentication-required".*/"rpc-authentication-required": true,/g' -i settings.json
sed 's/"rpc-bind-address".*/"rpc-bind-address": "0.0.0.0",/g' -i settings.json
sed 's/"rpc-enabled".*/"rpc-enabled": true,/g' -i settings.json
sed "s/\"rpc-password\".*/\"rpc-password\": \"$TRANSPASS\",/g" -i settings.json
sed "s/\"rpc-port\".*/\"rpc-port\": $TRANSPORT,/g" -i settings.json
sed 's#"rpc-url".*#"rpc-url": "/transmission/",#g' -i settings.json
sed "s/\"rpc-username\".*/\"rpc-username\": \"$TRANSUSR\", /g" -i settings.json
sed 's/"rpc-whitelist".*/"rpc-whitelist": "*",/g' -i settings.json
sed 's/"rpc-whitelist-enabled".*/"rpc-whitelist-enabled": true,/g' -i settings.json
sed 's/"download-queue-size".*/"download-queue-size": 999,/g' -i settings.json
sed 's/"max-peers-global".*/"max-peers-global": 99999,/g' -i settings.json
sed 's/"umask".*/"umask": 0,/g' -i settings.json
sed 's/"pex-enabled".*/"pex-enabled": false,/g' -i settings.json
sed 's/"dht-enabled".*/"dht-enabled": false,/g' -i settings.json

sed '2a "watch-dir":"/root/torrents",' -i settings.json
sed '2a "watch-dir-enabled":true,' -i settings.json

service transmission-daemon start
