# Dockerize Git on a server

[Raw Git Server](http://git-scm.com/book/en/v1/Git-on-the-Server-Getting-Git-on-a-Server)

1. Generate keys
  * `$ ssh-keygen -t rsa -C "your_email@example.com"`
2. Get key in the right place to build docker image
  * `$ cat ~/.ssh/id_rsa.pub >> ansible/files/authorized_keys`
3. Run docker git-server container
  * On docker host, if /opt/git directory does not exist will be created.
  * `$ docker run --name git-server -d -p 24:22 -v /opt/git:/opt/git/repositories org.tecris.ubuntu1404.util/git-server`
  * `$ sudo chmod -R o+w /opt/git`
4. How to add new git repository:
  * `$ git init --bare name_of_repo.git`
  * `$ scp -P 24 -r name_of_repo.git git@172.25.1.88:/opt/git/repositories`
  * `$ git clone ssh://git@172.25.1.88:24/opt/git/repositories/name_of_repo.git`
5.How to add new keys:
 * `$ scp -P 24 user_id_rsa.pub git@172.25.1.88:/home/git`
 * `$ ssh -p 24 git@172.25.1.88`
 * `$ cat user_id_rsa.pub >> /home/git/.ssh/authorized_keys`
