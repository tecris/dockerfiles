
.) Maven
  .) Maven installations...
    .) Manage Jenkins > Configure System > Maven > Maven installations > Add Maven
      .) Deselect 'Install automatically', 
      .) Name: maven331
      .) MAVEN_HOME: /opt/apache-maven-3.3.1
.) Docker builder
 .) Docker URL: unix:///var/run/docker.sock



==== D E M O ====

.) Create new job
 .) Project name: Continuous Delivery
 .) Maven project
 .) Source Code Management
  .) Git: git@172.25.1.88:/opt/git/repositories/demo.git


.) Build
 .) Goals and options: deploy -DskiptITs
.) Post Build:
 .) Shell
  .) docker pull image_name
 .) Docker build step
  .) ...
