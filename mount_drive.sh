#!/bin/bash

if [[ $# -lt 1 ]]; then
	echo "This app requires one argument: the encrypted device to be mounted."
	exit 1
fi

device=$1

sudo cryptsetup luksOpen /dev/$device backup_storage
sudo mount /dev/mapper/backup_storage /mnt
