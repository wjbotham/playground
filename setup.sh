#!/bin/sh

add-apt-repository ppa:transmissionbt/ppa
apt-get update
apt-get -y install transmission-cli transmission-common transmission-daemon

transmission-remote -n 'transmission:transmission' -a http://releases.ubuntu.com/17.10/ubuntu-17.10-desktop-amd64.iso.torrent
transmission-remote -n 'transmission:transmission' -a http://releases.ubuntu.com/17.10/ubuntu-17.10-server-amd64.iso.torrent
transmission-remote -n 'transmission:transmission' -a http://releases.ubuntu.com/17.10/ubuntu-17.10-server-i386.iso.torrent

watch -n 1 "df -h; echo; transmission-remote -n 'transmission:transmission' -l"
