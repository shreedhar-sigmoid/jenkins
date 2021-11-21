pipeline {
    agent any 
    environment {
     secrete= credentials('p-sample')
    }
    stages {
        stage('Build')  {
            steps {
               retry(3) {
                 
                  echo "Hello"
               }
            }
        }
    }
    post {
        always {
           echo "I always"
        } 
        failure {
           echo "I failed"
        } 
        success {
           echo "I succesed"
        } 
        unstable {
           echo "I unstopble"
        } 
        
    }
}
