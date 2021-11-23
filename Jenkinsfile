pipeline {
    agent any
    environment {
        GCR_CRED = credentials('ASS')
    }

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
               ./jenkins/push/push.sh
               echo Push
               '''
           }
        }
        stage("Deploy") {
         steps {
            sh '''
               ./jenkins/deploy/deploy.sh
               echo Deploy
               '''
           }
        }
    }
}
