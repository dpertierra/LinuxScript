#!/bin/bash
if [ $EUID -ne 0 ]; then
    echo "$0 is not running as root. Try using sudo."
    exec sudo "$0" "$@"
    exit $0?
fi
sudo apt install grub-efi grub2-common grub-customizer
sudo grub-install
sudo cp /boot/grub/x86_64-efi/grub.efi /boot/efi/EFI/pop/grubx64.efi
grub-customizer
