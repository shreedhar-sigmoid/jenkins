pipeline {
    agent any

    stages {
        stage("Build") {
          steps {
             sh '''
               ./jenkins/build/build.sh
               '''
             }
        }
        stage("Push") {
           steps {
            sh '''
               echo Push
               '''
           }
        }
        stage("Deploy") {
         steps {
            sh '''
               echo Deploy
               '''
           }
        }
    }
}
