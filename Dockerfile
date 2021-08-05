FROM        maven:3.8.1-jdk-8-slim
RUN         ln -sf /bin/bash /bin/sh
RUN         useradd -ms /bin/bash todoapp
WORKDIR     /home/todoapp/users
COPY        . /home/todoapp/users
RUN         mvn clean package
WORKDIR     /home/todoapp/users/target
RUN         ls
COPY        /home/todoapp/users/target/users-api-0.0.1.jar  users.jar
RUN         ls
COPY        users.service /etc/systemd/system/users.service
CMD         ["java", "-jar", "users.jar"]




