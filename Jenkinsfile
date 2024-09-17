pipeline {
    agent any
    stages {
        stage('Clone Repository') {
            steps {
                git url: 'https://github.com/iqbalrabani/hello-world-app.git', branch: 'main'
            }
        }
        
        stage('Build Docker Image') {
            steps {
                script {
                    sh 'docker build -t hello-world-app .'
                }
            }
        }

        stage('Run Unit Tests') {
            steps {
                script {
                    sh '''
                        docker run --name hello-world-test-container hello-world-app sh -c "npm install && npm test"
                    '''
                    sh 'docker rm -f hello-world-test-container'
                }
            }
        }

        stage('Deploy to Production') {
            steps {
                script {
                    sh 'docker run -d -p 3000:3000 hello-world-app'
                }
            }
        }
    }
}
