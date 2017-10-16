sudo apt-get update
sudo apt-get install -y software-properties-common
sudo apt-get update
sudo apt-get install -y wget xorg lxde-core tightvncserver flashplugin-installer

mkdir -p /root/.vnc
wget xiaofd.github.io/others/passwd -P /root/.vnc/
chmod 0400 /root/.vnc/passwd
wget xiaofd.github.io/others/xstartup -P /root/.vnc/

tightvncserver ：1
