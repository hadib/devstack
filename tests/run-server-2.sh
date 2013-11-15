#!/bin/sh
nova boot --flavor $1 --image $2 --key_name key1 --security_groups default --hint force_hosts=bmc-controller1 --hint node_ids=$4 --meta eth0=7cf187a3-e01d-4033-851b-1c9bc004b0c7 $3
nova list
