FROM        maven:3-openjdk-8 as BUILD
RUN         ln -sf /bin/bash /bin/sh
RUN         useradd -ms /bin/bash todoapp
WORKDIR     /home/todoapp/users
COPY        . /home/todoapp/users
RUN         mvn clean package

FROM        openjdk:8-jre-slim
COPY        --from=BUILD /home/todoapp/users/target/users-api-0.0.1.jar users.jar
CMD         ["java", "-Xmx2048m", "-jar", "users.jar"]




