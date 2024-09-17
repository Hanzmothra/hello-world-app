pipeline {
    agent any
    stages {
        stage('Clone Repository') {
            steps {
                git url: 'https://github.com/iqbalrabani/hello-world-app.git', credentialsId: 'github-credentials'
            }
        }
        
        stage('Build Docker Image') {
            steps {
                script {
                    dockerImage = docker.build("hello-world-app")
                }
            }
        }
        
        stage('Run Unit Tests') {
            steps {
                script {
                    dockerImage.inside {
                        sh 'npm install'
                        sh 'npm test'
                    }
                }
            }
        }
        
        stage('Deploy to Production') {
            steps {
                script {
                    dockerImage.run('-p 3000:3000')
                }
            }
        }
    }
}
