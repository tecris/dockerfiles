#!/bin/bash
# refer to http://manpages.ubuntu.com/manpages/jaunty/man3/DateTime::TimeZone::Catalog.3pm.html for timezone
echo "Europe/London" > /etc/timezone    
dpkg-reconfigure -f noninteractive tzdata
/createListener.sh > $ORACLE_HOME/network/admin/listener.ora
/etc/init.d/oracle-xe start
/bin/bash
