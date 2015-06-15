#/bin/bash
SERVER=127.0.0.1 PORT=8080
if (: < /dev/tcp/$SERVER/$PORT) 2>/dev/null
then
    echo "Port $PORT is already used, stop application using port $PORT, and run again this script"
else
    docker-compose -f k8s.yml up -d
fi
