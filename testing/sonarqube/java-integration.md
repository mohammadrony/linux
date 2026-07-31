# Java Integration

## SpringBoot Maven

```sh
vi pom.xml
```

```xml
<project ...>
  <dependencies>

    <dependency>
      <groupId>org.jacoco</groupId>
      <artifactId>jacoco-maven-plugin</artifactId>
      <version>0.8.12</version>
    </dependency>
    <dependency>
      <groupId>org.sonarsource.scanner.maven</groupId>
      <artifactId>sonar-maven-plugin</artifactId>
      <version>5.0.0.4389</version>
    </dependency>

  </dependencies>
  <build>
    <plugins>

      <plugin>
        <groupId>org.jacoco</groupId>
        <artifactId>jacoco-maven-plugin</artifactId>
        <version>0.8.12</version>
        <executions>
          <execution>
            <id>prepare-agent</id>
            <goals>
              <goal>prepare-agent</goal>
            </goals>
          </execution>
          <execution>
            <id>report</id>
            <goals>
              <goal>report</goal>
            </goals>
            <configuration>
              <formats>
                <format>XML</format>
              </formats>
            </configuration>
          </execution>
        </executions>
      </plugin>

    </plugins>
  </build>
</project>
```

Run analysis

```sh
mvn clean verify sonar:sonar \
  -Dsonar.scm.provider=git \
  -Dsonar.projectKey=project-key \
  -Dsonar.projectName=project-name \
  -Dsonar.host.url=http://sonar.example.com \
  -Dsonar.token=TOKEN \
  # -DskipTests
```
