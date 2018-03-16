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

# Namenode(rp00.tac42.net)
+ HDFS Information http://rp00.tac42.net:9870/
+ Cluster Metrics http://rp00.tac42.net:8088/

# HDFS Tips
```sh
$ hadoop fs -mkdir src_json
$ hadoop fs -put ./local_src_json/*.json src_json/
$ hadoop job -list all # check running jobs
```

# Hive Tips

```sh
$ schematool -dbType derby -initSchema # only first time
$ beeline -u jdbc:hive2://
```

```sql
CREATE TABLE raw_json (line STRING);
LOAD DATA LOCAL INPATH '<path to local files>' INTO TABLE raw_json;

# Or move filed on hdfs
# LOAD DATA INPATH '<path to hdfs files>' INTO TABLE iris;


SELECT * from raw_json LIMIT 100;
SELECT COUNT(*) from raw_json;
```


# Trouble Shoot

## Name node is in safe mode.
```
$ hadoop dfsadmin -safemode leave
```
