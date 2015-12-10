# Dockerize Git on a server
============================================

Raw [Git Server](http://git-scm.com/book/en/v1/Git-on-the-Server-Getting-Git-on-a-Server)

1. Generate keys
  * `$ ssh-keygen -t rsa -b 4096 -C "your_email@example.com"`
2. Get key in the right place to build docker image
  * `$ cat ~/.ssh/id_rsa.pub >> ansible/files/authorized_keys`
3. Run docker git-server container
  * On docker host, if /opt/docker_volumes/git/repositories directory does not exist will be created.
  * `$ docker run --name git-server -d -p 22:22 -v /opt/docker_volumes/git/repositories:/opt/git/repositories casa.docker/git-server`
  * `$ sudo chmod -R o+w /opt/docker_volumes/git`
4. How to create new repository
  * `$ git init --bare ionradan.git`
5. How to create bare repository out of an existing repository
  * `git clone --bare repo_to_bare_clone ionradan.git`
6. How to add a repository to git server:
  * `$ scp -r ionradan.git git@10.1.1.8:/opt/git/repositories`
7. Clone repository:
  * Standard ssh port
    * `$ git clone git@10.1.1.8:/opt/git/repositories/ionradan.git`
  * Non-standard ssh port
    * `git clone ssh://git@localhost:24/opt/git/repositories/ionradan.git`
8. How to add new keys:
 * `$ scp user_id_rsa.pub git@10.1.1.8:/home/git`
 * `$ ssh git@10.1.1.8`
 * `$ cat user_id_rsa.pub >> /home/git/.ssh/authorized_keys`

A. Keys outside container
 .) append public key to /opt/docker_volumes/git/.ssh/authorized_keys, and run
 .) setPermissions.sh
