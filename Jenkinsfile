pipeline {
    agent any
    environment {
        GCR_CRED = credentials('ASSIGNMENT')
    }

    stages {
        stage("Build") {
          steps {
             sh '''
               ./jenkins/build/build.sh
               echo "Build"
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
