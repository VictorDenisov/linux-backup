#!/bin/bash

sudo umount /mnt
sudo cryptsetup luksClose /dev/mapper/backup_storage
