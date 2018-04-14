#!/bin/sh

TORRENT=http://academictorrents.com/download/5daa22057577521a378b71e0f0de6a934bd5c2ea.torrent
USER=ec2-user
EFS_DIR=/home/$USER/efs
DOWNLOAD_DIR=$EFS_DIR/Downloads
EFS_FILE_SYSTEM=fs-c5f95c8d.efs.us-east-1.amazonaws.com

# Download deps
yum -y install amazon-efs-utils transmission-cli transmission-common transmission-daemon

# Mount the EFS 
mkdir $EFS_DIR
echo "Mounting EFS..."
mount -t nfs -o nfsvers=4.1,rsize=1048576,wsize=1048576,hard,timeo=600,retrans=2 $EFS_FILE_SYSTEM:/ $EFS_DIR

# Start torrenting
service transmission-daemon start
mkdir $DOWNLOAD_DIR
transmission-remote -n 'transmission:transmission' -a $TORRENT -w $DOWNLOAD_DIR

# Monitor results
watch -n 1 "df -h; echo; transmission-remote -n 'transmission:transmission' -l"
