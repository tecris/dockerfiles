## Kubernetes with CoreOS (virtualized on Ubuntu with libvirt)

based on https://coreos.com/os/docs/latest/booting-with-libvirt.html

Steps:
 -) Install Ubuntu 14.04 on metal
 -) Install libvirt 
 sudo apt-get install dnsmasq ebtables qemu-kvm qemu virt-manager virt-viewer libvirt-bin
sudo usermod -a -G libvirtd $USER
log out/login
virsh -c qemu:///system pool-list
virsh list --all
 
Kubernetes running on coreos, that in turn is virualized with libvirt.
libvirt networking: virtual in routed mode

Setup: 2(two) physical machines:

machine A - 192.168.1.72
libvirt subnet - 192.168.122.*

machine B - 192.168.1.73
libvirt subnet - 192.168.123.*
