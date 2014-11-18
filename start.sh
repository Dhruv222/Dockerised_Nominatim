#!/bin/bash
sysctl -w kernel.shmmax=1073741824
service postgresql start
if [ -z $OPTIMIZE_POSTGRESQL ]; then
  ./configPostgresql.sh dw n
  service postgresql restart
fi
tail -f /var/log/apache2/* &
/usr/sbin/apache2ctl -D FOREGROUND
