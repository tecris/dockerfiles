# Dockerize Nexus
============================================

1. Nexus available at http://10.0.0.2:8081 
 * `user/password: admin/admin123`
2. [Configure-Maven-to-Deploy-to-Nexus][1]
 * Add in project pom:
 ```
  <distributionManagement>
        <repository>
            <id>deployment</id>
            <name>Internal Releases</name>
            <url>http://10.0.0.2:8081/content/repositories/releases/</url>
        </repository>
        <snapshotRepository>
            <id>deployment</id>
            <name>Internal Releases</name>
            <url>http://10.0.0.2:8081/content/repositories/snapshots</url>
        </snapshotRepository>
    </distributionManagement>
 ```
   * Add following snippet in ~/.m2/settings.xml
 ```
  <servers>
    <server>
      <id>deployment</id>
      <username>deployment</username>
      <password>deployment123</password>
    </server>
  </servers>
</settings>
 ```
3. [Repository Management with Nexus][2]
```
<mirrors>
    <mirror>
      <id>local.mirror</id>
      <name>Nexus-Mirror</name>
      <url>http://10.0.0.2:8081/content/groups/public</url>
      <mirrorOf>*</mirrorOf>
    </mirror>
  </mirrors>
  <profiles>
    <profile>
      <id>nexus</id>
      <!--Enable snapshots for the built in central repo to direct -->
      <!--all requests to nexus via the mirror -->
      <repositories>
        <repository>
          <id>central</id>
          <url>http://central</url>
          <releases><enabled>true</enabled></releases>
          <snapshots><enabled>true</enabled></snapshots>
        </repository>
      </repositories>
     <pluginRepositories>
        <pluginRepository>
          <id>central</id>
          <url>http://central</url>
          <releases><enabled>true</enabled></releases>
          <snapshots><enabled>true</enabled></snapshots>
        </pluginRepository>
      </pluginRepositories>
    </profile>
  </profiles>
  <activeProfiles>
    <!--make the profile active all the time -->
    <activeProfile>nexus</activeProfile>
  </activeProfiles>
```

[1]:https://support.sonatype.com/entries/21283268-Configure-Maven-to-Deploy-to-Nexus

[2]:http://books.sonatype.com/nexus-book/reference/config-maven.html

