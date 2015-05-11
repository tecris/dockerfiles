
.) Maven
  .) Maven installations...
    .) Manage Jenkins > Configure System > Maven > Maven installations > Add Maven
      .) Deselect 'Install automatically', 
      .) Name: maven331
      .) MAVEN_HOME: /opt/apache-maven-3.3.1
.) Docker builder
 .) Docker URL: unix:///var/run/docker.sock



==== D E M O ====

-) SCRIPTING

 .) demo/createJob.sh
 .) Configure job
   .) Source Code Management
     .) add credentials (add SSH username with private key)
   .) Execute Docker container -> Push image
     .) add credentials (add username with password, any username, any password)
  


-) MANUAL

.) Create new job
 .) Project name: Continuous Delivery
 .) Maven project
 .) Source Code Management
  .) Git: git@172.25.1.88:/opt/git/repositories/demo.git


.) Build
 .) Goals and options: deploy -DskiptITs
.) Post Build:
 .) Execute shell
  .) docker pull jenkins
 .) Execute Docker container
  .) Docker command: Create image
    .) Build context folder: /opt/demo/Continuous_Delivery/docker
    .) Tag of the resulting: 172.25.1.88:5000/hl_demo:$BUILD_NUMBER
    .) Check 'Don't use the cache ...'
 .) Execute Docker container
  .) Docker command: Push image
    .) Name of the image: hl_demo
    .) Tag: $BUILD_NUMBER 
    .) Registry: 172.25.1.88:5000
    .) Registry Server Addresses: http://172.25.1.88:5000
    .) Docker Credential: add username with password, any username, any password 
