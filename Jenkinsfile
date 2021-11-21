pipeline {
    agent any

    stages {
        stage("Build") {
            sh '''
               ./jenkins/build/build.sh

               '''
        }
        stage("Push") {
            sh '''
               echo Push

               '''
        }
        stage("Deploy") {
            sh '''
               echo Deploy
               
               '''
        }
    }
}
