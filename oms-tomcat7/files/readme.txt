
.) oms.properties
  - PROJECT_HOME/server/src/main/properties/oms.properties

-) reports-33-SNAPSHOT.jar
  - $ cd PROJECT_HOME/reports
  - $ mvn clean package
  - $ cp target/reports-33-SNAPSHOT.jar to_desire_location

-) nzwood-oms.war
  - $ cd PROJECT_HOME/server
  - $ mvn clean package
  - $ cp target/nzwood-oms.war to_desire_location
