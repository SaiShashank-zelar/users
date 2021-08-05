FROM        maven:3-openjdk-8
RUN         ln -sf /bin/bash /bin/sh
RUN         useradd -ms /bin/bash todoapp
WORKDIR     /home/todoapp/users
COPY        . /home/todoapp/users
RUN         mvn clean package
WORKDIR     /home/todoapp/users
COPY        user.service /etc/systemd/system/user.service
CMD         ["java", "-jar", "users.jar"]




