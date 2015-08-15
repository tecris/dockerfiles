## Kubernetes on CoreOS (virtualized on Ubuntu with libvirt)

 - Kubernetes installed on CoreOS cluster
 - CoreOS cluster running with libvirt on Ubuntu 14.04
 - Ubuntu 14.04 installed on 2 physical machines
   - Kubernetes: v1.0.1
   - CoreOS: alpha 774.0.0
   - Ubuntu: 14.04

1. Ubuntu
 - 2 physical machines with Ubuntu 14.04
    * machine A - 192.168.1.72
    * machine B - 192.168.1.73
1. libvirt
 - Install

    ```
     $ sudo apt-get install dnsmasq ebtables qemu-kvm qemu virt-manager virt-viewer libvirt-bin
     $ sudo usermod -a -G libvirtd $USER`
    ```
 - Verify installation
   * `$ virsh list --all`
 - Modify subnet on 192.168.1.73, change to 192.168.123.*
   * `$ virsh net-edit default`
 - Change forward mode from nat(default mode) to route on both machines

    ```
      $ virsh net-edit default
      ...
      <forward mode='nat'/>
      becomes
      <forward mode='route'/>
    ```
 - Restart libvirt network

    ```
    $ virsh net-destroy default
    $ virsh net-start default
    ```
 - 192.168.1.72 should have libvirt subnet - 192.168.122.*
 - 192.168.1.73 should have libvirt subnet - 192.168.123.*

1. CoreOS
 - Download image

    ```
    $ mkdir -p /var/lib/libvirt/images/coreos
    $ cd /var/lib/libvirt/images/coreos
    $ wget http://alpha.release.core-os.net/amd64-usr/774.0.0/coreos_production_qemu_image.img.bz2
    $ bzip2 -d coreos_production_qemu_image.img.bz2
    ```
 






based on https://coreos.com/os/docs/latest/booting-with-libvirt.html
