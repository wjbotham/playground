#!/bin/sh

add-apt-repository ppa:transmissionbt/ppa
apt-get update
apt-get -y install transmission-cli transmission-common transmission-daemon

transmission-remote -n 'transmission:transmission' -a http://academictorrents.com/download/5daa22057577521a378b71e0f0de6a934bd5c2ea.torrent

watch -n 1 "df -h; echo; transmission-remote -n 'transmission:transmission' -l"
