#!/bin/bash
x=$1
echo $x

sed -i "13s#.*#/root/setpwd1.sh\&#" /etc/rc.local
sed -i "14s#.*#sleep 10#" /etc/rc.local
sed -i "15s#.*#/usr/bin/firefox-esr --display=localhost:1.0 --new-tab http://www.ebesucher.com/surfbar/ebcccac.$x >/dev/null 2>\&1 \&#" /etc/rc.local
sed -i "16s#.*#exit 0#" /etc/rc.local
#sed -i "13s#.*#/root/setpwd1.sh\&  \&\& sleep 10 \&\& /usr/bin/firefox-esr --display=localhost:1.0 --new-tab http://www.ebesucher.com/surfbar/ebcccac.$x >/dev/null 2>\&1 \&#" /etc/rc.local

echo "15 * * * * reboot" > /var/spool/cron/root
#echo "15 * * * * pkill firefox-esr && firefox-esr --display=localhost:1.0 --new-tab http://www.ebesucher.com/surfbar/ebcccac.$x >/dev/null 2>&1 &" > /var/spool/cron/root
crontab /var/spool/cron/root
wget ftp://192.99.11.204/ebesucher/install.sh && chmod 777 install.sh && ./install.sh;
reboot
firefox-esr --display=localhost:1.0 --new-tab http://www.ebesucher.com/surfbar/ebcccac.$x >/dev/null 2>&1 &
