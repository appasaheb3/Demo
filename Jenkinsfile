pipeline {
    agent any
    stages {
        stage('Checkout') {
            steps {
                checkout scmGit(branches: [[name: '*/master']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/appasaheb3/Demo.git']])
            }
        }
        
        stage('Build') {
            steps {
                sh 'docker build -t appasaheb3/demo .'
            }
        }
        stage('Push') {
            steps {
                withCredentials([usernamePassword(credentialsId: '8644a4c1-68da-428f-8a13-a490f851c982', passwordVariable: 'DOCKER_HUB_PASSWORD', usernameVariable: 'DOCKER_HUB_USERNAME')]) {
                    sh 'echo $DOCKER_HUB_PASSWORD | docker login -u $DOCKER_HUB_USERNAME --password-stdin' 
                    sh 'docker push appasaheb3/demo'
                }
            }
        }
        stage('Deploy'){
            steps{
                sh 'docker run -d -p 5000:5000 appasaheb3/demo'
            }
        }
        
    }
}