
.) Maven
  .) Maven installations...
    .) Manage Jenkins > Configure System > Maven > Maven installations > Add Maven
      .) Deselect 'Install automatically', 
      .) Name: maven331
      .) MAVEN_HOME: /opt/apache-maven-3.3.1
      .) 
      Save
.) Maven Configuration
  .) Default settings provider: Select 'Settings file in filesystem', File path: /opt/settings.xml

.) Create new job
 .) Project name: Continuous Delivery
 .) Maven project
 .) Source Code Management
  .) Git: git@172.25.1.88:/opt/git/repositories/demo.git

==== D E M O ====

.) Build
 .) Goals and options: deploy -DskiptITs
.) Post Build:
 .) Shell
  .) docker pull image_name
 .) Docker build step
  .) ...
