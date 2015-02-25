#install all necessary packages
apt-get update
apt-get -y install libaio1 net-tools bc nano

cd /tmp/filesOracle

#resolve some stupid link conflits
ln -s /usr/bin/awk /bin/awk
mkdir /var/lock/subsys
cp /tmp/filesOracle/chkconfig /sbin/chkconfig
chmod 755 /sbin/chkconfig
ln -s /proc/mounts /etc/mtab

#convert rpm to deb
sudo alien --to-deb --scripts /tmp/filesOracle/oracle-xe-11.2.0-1.0.x86_64.rpm
rm /tmp/filesOracle/oracle-xe-11.2.0-1.0.x86_64.rpm
dpkg --install /tmp/filesOracle/oracle-xe_11.2.0-2_amd64.deb

#change memory_target
cp /tmp/filesOracle/init.ora $ORACLE_HOME/config/scripts
cp /tmp/filesOracle/initXETemp.ora $ORACLE_HOME/config/scripts

#final configuration
/usr/bin/printf 8084\\n1521\\noracle\\noracle\\ny\\n | /etc/init.d/oracle-xe configure

cp /tmp/filesOracle/run.sh /
cp /tmp/filesOracle/createListener.sh /
