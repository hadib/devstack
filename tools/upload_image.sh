#!/bin/bash

source ~/devstack/functions
DEST=~
IMG=$1

REAL_KERNEL_ID=$(glance image-create --name "baremetal-64-real-kernel" --public --container-format aki --disk-format aki < "$DEST/kernel" | grep ' id ' | get_field 2)

#REAL_RAMDISK_ID=$(glance --os-auth-token $TOKEN --os-image-url http://$GLANCE_HOSTPORT image-create --name "baremetal-real-ramdisk" --public --container-format ari --disk-format ari < "$DEST/initrd" | grep ' id ' | get_field 2)
REAL_RAMDISK_ID=$(glance image-create --name "baremetal-64-real-ramdisk" --public --container-format ari --disk-format ari < "$DEST/initrd" | grep ' id ' | get_field 2)

#glance --os-auth-token $TOKEN --os-image-url http://$GLANCE_HOSTPORT image-create --name "Ubuntu" --public --container-format bare --disk-format raw --property kernel_id=$REAL_KERNEL_ID --property ramdisk_id=$REAL_RAMDISK_ID < "$IMG"
glance image-create --name "Ubuntu64" --public --container-format bare --disk-format raw --property kernel_id=$REAL_KERNEL_ID --property ramdisk_id=$REAL_RAMDISK_ID < "$IMG"

