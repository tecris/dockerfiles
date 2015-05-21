# Dockerize Git on a server
============================================

Raw [Git Server](http://git-scm.com/book/en/v1/Git-on-the-Server-Getting-Git-on-a-Server)

1. Generate keys
  * `$ ssh-keygen -t rsa -C "your_email@example.com"`
2. Get key in the right place to build docker image
  * `$ cat ~/.ssh/id_rsa.pub >> ansible/files/authorized_keys`
3. Run docker git-server container
  * On docker host, if /opt/git directory does not exist will be created.
  * `$ docker run --name git-server -d -p 24:22 -v /opt/git:/opt/git/repositories org.tecris.ubuntu1404.util/git-server`
  * `$ sudo chmod -R o+w /opt/git`
4. How to create new repository
  * `$ git init --bare name_of_repo.git`
5. How to create bare repository out of an existing repository
  * `git clone --bare repo_to_bare_clone name_of_repo.git`
6. How to add a repository to git server:
  * `$ scp -r name_of_repo.git git@172.25.1.88:/opt/git/repositories`
7. Clone repository:
  * `$ git clone git@172.25.1.88:/opt/git/repositories/name_of_repo.git`
8. How to add new keys:
  * `$ scp user_id_rsa.pub git@172.25.1.88:/home/git`
  * `$ ssh git@172.25.1.88`
  * `$ cat user_id_rsa.pub >> /home/git/.ssh/authorized_keys`
