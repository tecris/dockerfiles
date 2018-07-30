#!/bin/bash
# wait-for-mysql.sh

set -e
set -x

host="$1"
shift
cmd="$@"

until mysql -h"$host" -uroot -pmysql -e "SELECT 1;"; do
  >&2 echo "Mysql is unavailable - sleeping"
  sleep 1
done

>&2 echo "Mysql is up - executing command"
exec $cmd
