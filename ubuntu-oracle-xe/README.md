# Oracle XE Docker container

Based on [cheesang]

- Download [Oracle 11g XE]

- Convert *.rpm to *.deb
```
    apt-get install alien
    sudo alien --to-deb --scripts oracle-xe-11.2.0-1.0.x86_64.rpm
```

[cheesang]:https://index.docker.io/u/cheesang/docker-oracle11xe/
[Oracle 11g XE]:http://www.oracle.com/technetwork/database/database-technologies/express-edition/downloads/index.html
