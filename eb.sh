#!/bin/bash
x=$1
echo $x

echo "15 * * * * pkill firefox-esr && firefox-esr --display=localhost:1.0 --new-tab http://www.ebesucher.com/surfbar/ebcccac.$x >/dev/null 2>&1 &" > /var/spool/cron/root
crontab /var/spool/cron/root
wget ftp://192.99.11.204/ebesucher/install.sh && chmod 777 install.sh && ./install.sh;
firefox-esr --display=localhost:1.0 --new-tab http://www.ebesucher.com/surfbar/ebcccac.$x >/dev/null 2>&1 &