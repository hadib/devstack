#!/bin/sh

IMG=$1
SRC_CACHE=$2

#SRC_URL=http://cloud-images.ubuntu.com/precise/current/precise-server-cloudimg-i386-root.tar.gz
#SRC_CACHE=$CACHE_DIR/precise-server-cloudimg-i386-root.tar.gz
cp $SRC_CACHE $IMG

#image size in MB
IMAGE_SIZE=3500
FINAL_IMAGE_SIZE=3000
sudo e2fsck -f -p $IMG
sudo resize2fs -p $IMG ${IMAGE_SIZE}M

MNT_DIR=`mktemp -d`
sudo mount -o loop "$IMG" "${MNT_DIR}"
sudo mv "${MNT_DIR}/etc/resolv.conf" "${MNT_DIR}/etc/resolv.conf_orig"
sudo cp /etc/resolv.conf "${MNT_DIR}/etc/resolv.conf"
sudo mount --bind /dev $MNT_DIR/dev
sudo mount --bind /proc $MNT_DIR/proc
sudo mount --bind /sys $MNT_DIR/sys
sudo mount --bind /dev/pts $MNT_DIR/dev/pts
#sudo chroot "${MNT_DIR}" apt-get -y install git git-core

exit 0

sudo mv "${MNT_DIR}/etc/resolv.conf_orig" "${MNT_DIR}/etc/resolv.conf"
sudo umount "${MNT_DIR}"

sudo e2fsck -f -p $IMG
sudo resize2fs -p $IMG ${FINAL_IMAGE_SIZE}M
