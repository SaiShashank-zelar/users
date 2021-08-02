FROM        maven:3.3-openjdk-8 as BUILD
RUN         useradd todoapp
USER        todoapp
WORKDIR     /home/todoapp/users
COPY        / .
RUN         mvn clean package

FROM        openjdk:8-jre-slim
COPY        --from=BUILD /home/todoapp/users/target/users-api-0.0.1.jar users.jar
COPY        users.service /etc/systemd/system/users.service
CMD         ["java", "-jar", "users.jar"]




