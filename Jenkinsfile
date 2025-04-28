pipeline {
    agent any

    stages {
        stage('Build') {
            agent {
                docker {
                    image 'node:18-alpine'
                }
            }
            steps {
                sh '''
                    ls -la
                    node --version
                    npm --version
                    docker build -t myapp:latest .
                '''
            }
        }
        stage('Test') {
            agent {
                docker {
                    image 'node:18-alpine'
                }
            }
            steps {
                sh '''
                    docker run -d -p 30000:3000 myapp:latest
                    sleep 5
                    curl -f http://localhost:30000
                '''
            }   
        }
    }
    post {
        always {
            // Ensure this path matches the location where your test results are being saved
            junit '**/test-results/junit.xml'
        }
    }
}