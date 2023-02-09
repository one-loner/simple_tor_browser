#!/bin/bash
if [ "$EUID" -ne 0 ]
  then echo "Please run as root."
  exit
fi
echo "Installing requirements:"
apt-get instasll python3 python3-pyqt5 python3-pyqt5.qtwebengine python3-pyqt5.qtwebsockets tor privoxy
echo "Installing simple tor browser."
cat privoxy.config > /etc/privoxy/config
systemctl restart privoxy
systemctl enable tor
systemctl enable privoxy
cp stb.sh /bin/stb
chmod +x /bin/stb
mkdir /etc/stb/
cp browser.py /etc/stb/simple-TOR-browser
echo "Done."
echo ""
echo ""
echo "Usage:"
echo ""
echo "stb <URL>"
