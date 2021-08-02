FROM        maven:3.8.1-jdk-8-slim AS  build-env
RUN         ln -sf /bin/bash /bin/sh
RUN         useradd -ms /bin/bash todoapp
WORKDIR     /home/todoapp/users
COPY        / .
RUN         mvn clean package
COPY        --from=build-env /home/todoapp/users/target/users-api-0.0.1.jar users.jar
RUN         dir
COPY        users.service /etc/systemd/system/users.service
CMD         ["java", "-jar", "users.jar"]




