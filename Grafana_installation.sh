#!/bin/bash

apt-get update
cd /tmp
wget https://dl.grafana.com/oss/release/grafana_5.4.3_amd64.deb
apt-get install -y adduser libfontconfig
dpkg -i grafana_5.4.3_amd64.deb 
systemctl daemon-reload
service grafana-server start
wget https://s3-eu-west-1.amazonaws.com/deb.robustperception.io/41EFC99D.gpg | apt-key add -
apt-get update
apt-get install prometheus prometheus-node-exporter prometheus-pushgateway prometheus-alertmanager -y
echo ""
echo "for basic system monitoring,  I am using CPU Utilization Details (Cores) [ID: 7039] custom dashboard. Copy the dashboard ID from here. "
echo ""


telegraf_plugins_extra:
 mysql:
  config:
     - servers = 
          ["root:1234567@tcp(localhost:3306)/"]
          

[agents:children]
redis
[all:vars]
ansible_ssh_user=centos
ansible_ssh_private_key_file=key.pem          
