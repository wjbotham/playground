#!/bin/sh

TORRENT=http://academictorrents.com/download/5daa22057577521a378b71e0f0de6a934bd5c2ea.torrent
DOWNLOAD_DIR=.

yum install transmission-cli transmission-common transmission-daemon
service transmission-daemon start

transmission-remote -n 'transmission:transmission' -a $TORRENT -w $DOWNLOAD_DIR

watch -n 1 "df -h; echo; transmission-remote -n 'transmission:transmission' -l"
