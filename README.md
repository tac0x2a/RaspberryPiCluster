# Raspberry Pi Cluster

## Write to SD (on mac)
```
$ diskutil list
$ diskutil unmountDisk /dev/disk<n>
$ sudo dd if=2017-11-29-raspbian-stretch-lite.img of=/dev/rdisk<n> bs=1m
```

### Enable ssh (on mac)
```
$ touch /Volumes/boot/ssh
```

## Fix IP (on raspi)
```
$ sudo nano /etc/dhcpcd.conf

# append above
interface eth0
static ip_address=192.168.11.150/24
static routers=192.168.11.1
static domain_name_servers=192.168.11.1
```

## send public key (on mac)
```
$ # ssh-keygen -t rsa
$ ssh-copy-id pi@192.168.11.150
$ ssh-copy-id pi@192.168.11.151
$ ssh-copy-id pi@192.168.11.152
$ ssh-copy-id pi@192.168.11.153
$ ssh-copy-id pi@192.168.11.154
```

# Ansible play book (on mac)
```
$ ansible-playbook -i inventory/hosts -u pi site.yml
```
