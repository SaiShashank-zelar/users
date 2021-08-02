FROM        openjdk:8-jdk-alpine
RUN         ln -sf /bin/bash /bin/sh
RUN         useradd -ms /bin/bash todoapp
WORKDIR     /home/todoapp/users
COPY        / .
RUN         mvn package
COPY        /home/todoapp/users/target/users-api-0.0.1.jar users.jar
COPY        users.service /etc/systemd/system/users.service
CMD         ["java", "-jar", "users.jar"]




