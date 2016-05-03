# Git server on Docker
============================================

Raw [Git Server](http://git-scm.com/book/en/v1/Git-on-the-Server-Getting-Git-on-a-Server)

#### Run docker git-server container
  ```
  $ docker run --name git-server -d -p 2224:22 -v /opt/docker_volumes/git/repositories:/opt/git/repositories casadocker/git-server
  $ sudo chmod -R o+w /opt/docker_volumes/git
  ```
  * On docker host, if /opt/docker_volumes/git/repositories directory does not exist will be created.

#### Add repository to git server
  ```
  $ git init --bare ionradan.git                               # create empty bare repository
  $ git clone --bare repo_to_bare_clone ionradan.git           # create bare repository out of an existing repository
  $ scp -r ionradan.git git@localhost:/opt/git/repositories    # move bare repository to git server
  $ git clone git@localhost:/opt/git/repositories/ionradan.git
  $ git clone ssh://git@localhost:24/opt/git/repositories/ionradan.git    # non-standard ssh port
   ```

##### Add key
 * `echo public_key.pub >> /opt/docker_volumes/git/.ssh/authorized_keys`, and run
 * `$ ./setPermissions.sh`

##### Generate keys
  * `$ ssh-keygen -t rsa -b 4096 -C "your_email@example.com"`
