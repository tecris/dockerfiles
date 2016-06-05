# Git server on Docker
</br>
Raw [Git Server](http://git-scm.com/book/en/v1/Git-on-t<e-Server-Getting-Git-on-a-Server) (ssh & git protocols)

#### Run docker git-server container
  `$ docker-compose up -d`

#### Add repository to git server
1. Create bare repository, either initiated as an empty repository or cloned from an existing repository.

  ```
  $ git init --bare ionradan.git                        # create empty bare repository
  $ git clone --bare repo_to_bare_clone ionradan.git    # create bare repository from an existing repository
  ```
1. Copy repository to git server

  ```
  $ docker cp ionradan.git git-server:/opt/git/repositories    # move bare repository to git server
  ```
1. Clone repository

 * ssh protocol

    ```
    $ git clone git@localhost:/opt/git/repositories/ionradan.git
    $ git clone ssh://git@localhost:2224/opt/git/repositories/ionradan.git    # non-standard ssh port
    ```

 * git protocol (read only)

    ```
    $ git clone git://localhost/ionradan.git
    ```

##### Add key
 * Add key to `files/authorized_keys` and rebuild image. Compromise to achieve the immutable environment principle.

##### Generate keys
  * `$ ssh-keygen -t rsa -b 4096 -C "your_email@example.com"`
