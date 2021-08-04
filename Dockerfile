FROM        maven:3.8.1-jdk-8-slim
RUN         ln -sf /bin/bash /bin/sh
RUN         useradd -ms /bin/bash todoapp
WORKDIR     /home/todoapp/users
COPY        . /home/todoapp/users
RUN         mvn clean package
COPY        /target/users-api-0.0.1.jar /home/todoapp/users/
RUN         ls
COPY        users.service /etc/systemd/system/users.service
RUN         ls
CMD         ["java", "-jar", "users.jar"]






