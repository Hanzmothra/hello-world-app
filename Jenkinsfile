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
                    sh '''
                        CONTAINER_ID=$(docker ps -q --filter "publish=3000")
                        if [ ! -z "$CONTAINER_ID" ]; then
                            docker stop $CONTAINER_ID
                            docker rm $CONTAINER_ID
                        fi
                    '''
                    dockerImage.run('-d -p 3000:3000')
                }
            }
        }
    }
}
