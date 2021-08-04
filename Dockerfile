FROM        maven:3.8.1-jdk-8-slim as BUILD
RUN         ln -sf /bin/bash /bin/sh
RUN         useradd -ms /bin/bash todoapp
WORKDIR     /home/todoapp/users
COPY        . /home/todoapp/users
RUN         mvn clean package
COPY        --from=BUILD /home/todoapp/users/target/users-api-0.0.1.jar /home/todoapp/users/users.jar
COPY        users.service /etc/systemd/system/users.service
RUN         ls

FROM        openjdk:8-jre-slim
CMD         ["java", "-jar", "users.jar"]




