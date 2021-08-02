FROM        openjdk:8-jdk-alpine
ARG         MAVEN_VERSION=3.8.1
RUN         useradd todoapp
USER        todoapp
WORKDIR     /home/todoapp/users
COPY        / .
RUN         mvn package
COPY        /home/todoapp/users/target/users-api-0.0.1.jar users.jar
COPY        users.service /etc/systemd/system/users.service
CMD         ["java", "-jar", "users.jar"]




