pipeline {
    agent any
    environment {
        GCR_CRED = credentials('ASSIGNMENT')
    }

    stages {
        stage("Build") {
          steps {
             sh ' ./jenkins/build/build.sh '

             }
        }
        stage("Push") {
           steps {
            sh ' ./jenkins/push/push.sh '

           }
        }
        stage("Deploy") {
         steps {
            sh ' ./jenkins/deploy/deploy.sh '
           }
        }
        stage("List") {
         steps {
            sh ' ./jenkins/list/list.sh '
           }
        }
    }
}
