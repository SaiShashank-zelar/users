FROM        maven:3.8.1-jdk-8-slim
RUN         ln -sf /bin/bash /bin/sh
RUN         useradd -ms /bin/bash todoapp
WORKDIR     /home/todoapp/users
COPY        / .
RUN         mvn clean package
RUN         dir
COPY        home/todoapp/users/target/* home/todoapp/users/users.jar
COPY        users.service /etc/systemd/system/users.service
CMD         ["java", "-jar", "users.jar"]




