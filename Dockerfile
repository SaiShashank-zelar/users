FROM        maven:3.8.1-jdk-8-slim
RUN         ln -sf /bin/bash /bin/sh
RUN         useradd -ms /bin/bash todoapp
WORKDIR     /home/todoapp/users
COPY        . /home/todoapp/users
RUN         mvn clean package
WORKDIR     /home/todoapp/users
RUN         ls
COPY        user.service /etc/systemd/system/user.service
CMD         ["java", "-jar", "users.jar"]




