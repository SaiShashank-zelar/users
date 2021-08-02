# Users:

### To install maven 

    #apt update
    
    #apt install maven -y

### To create a user:-

    #useradd -m -s /bin/bash todoapp
    
    #su - todoapp
    
### To clone git repository in the todoapp and run the maven project:-

    #git clone https://github.com/SaiShashank-zelar/users.git
    
    #mvn package
    
    #mv target/users-api-0.0.1.jar users.jar
    
### To create a service file:-

    #mv users.service /etc/systemd/system/users.service
    
    #systemctl daemon-reload

    #systemctl start users
 
    #systemctl restart users



![Screenshot (567)](https://user-images.githubusercontent.com/82635540/115705663-71809a80-a38a-11eb-8d60-2918cbdfe4d8.png)


##