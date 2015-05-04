# Dockerize Nexus
============================================

.) Nexus available at http://172.25.1.130:8081
user: admin
password: admin123

.) Project pom needs something like:

  <distributionManagement>
        <repository>
            <id>deployment</id>
            <name>Internal Releases</name>
            <url>http://172.25.1.88:8081/content/repositories/releases/</url>
        </repository>
        <snapshotRepository>
            <id>deployment</id>
            <name>Internal Releases</name>
            <url>http://172.25.1.88:8081/content/repositories/snapshots</url>
        </snapshotRepository>
    </distributionManagement>

.) cat ~/settings.xml 
<?xml version="1.0"?>
<settings xmlns="http://maven.apache.org/SETTINGS/1.0.0" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:schemaLocation="http://maven.apache.org/SETTINGS/1.0.0                       http://maven.apache.org/xsd/settings-1.0.0.xsd">
  <servers>
    <server>
      <id>deployment</id>
      <username>deployment</username>
      <password>deployment123</password>
    </server>
  </servers>
</settings>


