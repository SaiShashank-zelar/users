pipeline {
  agent {
    label 'todoapp'
  }
  stages {
    stage('Download Dependencies') {
      steps {
        sh '''
           mvn package
        '''

      }
    }
    stage('Prepare Artifacts') {
      steps {
        sh '''
           mv target/users-api-0.0.1.jar users.jar
           zip -r ../users.zip users.jar
        '''
      }

    }
  }


}