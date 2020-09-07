#!/bin/bash

apt-get update
wget https://dl.grafana.com/oss/release/grafana_5.4.3_amd64.deb
dpkg -i grafana_5.4.3_amd64.deb 
systemctl daemon-reload
service grafana-server start
service grafana-server status
wget https://s3-eu-west-1.amazonaws.com/deb.robustperception.io/41EFC99D.gpg | apt-key add -
apt-get update
apt-get install prometheus prometheus-node-exporter prometheus-pushgateway prometheus-alertmanager -y
